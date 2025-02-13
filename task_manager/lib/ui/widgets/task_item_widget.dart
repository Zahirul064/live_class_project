import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/ui/controllers/task_item_widget_controller.dart';
import '../../data/models/task_list_model.dart';

class TaskItems extends StatelessWidget {
  const TaskItems({
    super.key,
    required this.taskModel,
    required this.onDeleteTask,
    required this.onUpdateTaskStatus,
  });

  final TaskListModel taskModel;

  final Future<void> Function(String id) onDeleteTask;
  final Future<void> Function(String id, String status) onUpdateTaskStatus;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final String statusText = taskModel.status ?? 'New';
    final Color statusColor;

    switch (statusText) {
      case 'New':
        statusColor = Colors.cyan;
        break;
      case 'Progress':
        statusColor = Colors.amber;
        break;
      case 'Completed':
        statusColor = Colors.green;
        break;
      case 'Canceled':
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        tileColor: Colors.white,
        title: Text(
          taskModel.title ?? '',
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              taskModel.description ?? '',
            ),
            Text(
              'Date:${taskModel.createdDate ?? ''}',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    statusText,
                    style: textTheme.titleSmall?.copyWith(color: Colors.white),
                  ),
                ),
                Row(children: [
                  IconButton(
                    onPressed: () async {
                      final String? newStatus = await _showEditStatusDialog(
                        context,
                        taskModel.status ?? '',
                      );
                      if (newStatus != null && newStatus != taskModel.status) {
                        await onUpdateTaskStatus(
                            taskModel.sId ?? '', newStatus);
                      }
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.greenAccent,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      final bool? confirm = await showDialog<bool>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Delete!'),
                            content: const Text('Do you want to delete?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Get.back(result: false);
                                },
                                child: const Text('No'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.back(result: true);
                                },
                                child: const Text('Yes'),
                              ),
                            ],
                          );
                        },
                      );

                      if (confirm == true) {
                        await onDeleteTask(taskModel.sId ?? '');
                      }
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ])
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> _showEditStatusDialog(
      BuildContext context, String currentStatus) async {
    final TaskItemWidgetController taskItemWidgetController =
        Get.find<TaskItemWidgetController>();
    taskItemWidgetController.selectedStatus.value = currentStatus;
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update Task Status'),
          content: Obx(
            () => DropdownButton<String>(
              value: taskItemWidgetController.selectedStatus.value,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'New',
                  child: Text('New'),
                ),
                DropdownMenuItem(
                  value: 'Progress',
                  child: Text('Progress'),
                ),
                DropdownMenuItem(
                  value: 'Completed',
                  child: Text('Completed'),
                ),
                DropdownMenuItem(
                  value: 'Canceled',
                  child: Text('Canceled'),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  taskItemWidgetController.selectedStatus.value = value;
                }
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back(result: null);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.back(result: taskItemWidgetController.selectedStatus.value);
              },
              child: const Text(
                'Update',
                style: TextStyle(color: Colors.cyan),
              ),
            ),
          ],
        );
      },
    );
  }
}
