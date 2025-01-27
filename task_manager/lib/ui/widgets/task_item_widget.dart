import 'package:flutter/material.dart';
import 'package:task_manager/app.dart';
import 'package:task_manager/data/models/task_model.dart';
import 'package:task_manager/ui/utils/status_enum.dart';
import 'package:task_manager/ui/widgets/change_task_status_dialog.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';

import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';
import 'delete_confirmation_dialog.dart';
import '../screens/main_bottom_nav_screen.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    super.key,
    required this.taskModel,
  });

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      child: ListTile(
        title: Text(taskModel.title ?? ''),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(taskModel.description ?? ''),
            Text('Date: ${taskModel.createdDate ?? ''}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: _getStatusColor(
                        taskModel.status ?? enumTaskStatus.NewTask.name),
                  ),
                  child: Text(
                    taskModel.status ?? enumTaskStatus.NewTask.name,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        bool isConfirmed = await ConfirmationDialog
                            .showDeleteConfirmationDialog(context);
                        if (isConfirmed) {
                          _deleteTask(taskModel.sId!);
                          Navigator.pushReplacementNamed(
                              context, MainBottomNavScreen.name);
                        }
                      },
                      icon: const Icon(Icons.delete),
                    ),
                    IconButton(
                      onPressed: () async {
                        enumTaskStatus taskStatus =
                            await ChangeStatusDialog.showChangeStatusDialog(
                                context);
                        if (taskStatus.name != taskModel.status) {
                          _updateTask(taskStatus.name, taskModel.sId!);
                          Navigator.pushReplacementNamed(
                              context, MainBottomNavScreen.name);
                        }
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    if (status == enumTaskStatus.NewTask.name) {
      return Colors.blue;
    } else if (status == enumTaskStatus.Progress.name) {
      return Colors.purple;
    } else if (status == enumTaskStatus.Canceled.name) {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }

  Future<void> _deleteTask(String sid) async {
    // _getTaskCountByStatusInProgress = true;
    // setState(() {});
    final NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.deleteTaskUrl(sid));
    if (response.isSuccess) {
      showSnackBarMessage(TaskManagerApp.navigatorKey.currentContext!,
          "Task deleted successfully.");
    } else {
      showSnackBarMessage(
          TaskManagerApp.navigatorKey.currentContext!, response.errorMessage);
    }
    // _getTaskCountByStatusInProgress = false;
    // setState(() {});
  }

  Future<void> _updateTask(String status, String sid) async {
    // _getTaskCountByStatusInProgress = true;
    // setState(() {});
    final NetworkResponse response = await NetworkCaller.getRequest(
        url: Urls.updateTaskStatusUrl(sid, status));
    if (response.isSuccess) {
      showSnackBarMessage(TaskManagerApp.navigatorKey.currentContext!,
          "Task status updated successfully.");
    } else {
      showSnackBarMessage(
          TaskManagerApp.navigatorKey.currentContext!, response.errorMessage);
    }
    // _getTaskCountByStatusInProgress = false;
    // setState(() {});
  }
}
