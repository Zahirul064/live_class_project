import 'package:flutter/material.dart';
import 'package:task_manager/app.dart';
import 'package:task_manager/data/models/task_count_by_status_model.dart';
import 'package:task_manager/data/models/task_list_by_status_model.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/utils/status_enum.dart';
import 'package:task_manager/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';
import 'package:task_manager/ui/widgets/task_item_widget.dart';
import 'package:task_manager/ui/widgets/tm_app_bar.dart';

class CompletedTaskListScreen extends StatefulWidget {
  const CompletedTaskListScreen({super.key});

  @override
  State<CompletedTaskListScreen> createState() => _CompletedTaskListScreenState();
}

class _CompletedTaskListScreenState extends State<CompletedTaskListScreen> {
  bool _getNewTaskListInProgress = false;
  TaskCountByStatusModel? taskCountByStatusModel;
  TaskListByStatusModel? newTaskListModel;

  @override
  void initState() {
    super.initState();
    _getNewTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TMAppBar(),
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Visibility(
                    visible: _getNewTaskListInProgress == false,
                    replacement: const CenteredCircularProgressIndicator(),
                    child: _buildTaskListView()),
              ),
            ],
          ),
        ),
      ),

    );
  }

  Widget _buildTaskListView() {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: newTaskListModel?.taskList?.length ?? 0,
      itemBuilder: (context, index) {
        return TaskItemWidget(
          taskModel: newTaskListModel!.taskList![index],
        );
      },
    );
  }


  Future<void> _getNewTaskList() async {
    _getNewTaskListInProgress = true;
    setState(() {});
    final NetworkResponse response =await NetworkCaller.getRequest(url: Urls.taskListByStatusUrl(enumTaskStatus.Completed.name));
    if (response.isSuccess) {
      newTaskListModel = TaskListByStatusModel.fromJson(response.responseData!);
    } else {
      showSnackBarMessage(TaskManagerApp.navigatorKey.currentContext!, response.errorMessage);
    }
    _getNewTaskListInProgress = false;
    setState(() {});
  }
}
