import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/data/models/task_list_model.dart';
import 'package:task_manager/ui/controllers/delete_task_list_controller.dart';
import 'package:task_manager/ui/controllers/progress_task_list_controller.dart';
import 'package:task_manager/ui/controllers/update_task_status_controller.dart';
import '../../data/models/task_count_model.dart';
import '../controllers/getTaskCountByStatusController.dart';
import '../widgets/center_circular_progress_indicator.dart';
import '../widgets/screen_background.dart';
import '../widgets/snack_bar_message.dart';
import '../widgets/task_count_status_widget.dart';
import '../widgets/task_item_widget.dart';
import '../widgets/tm_app_bar.dart';
import 'add_new_task_list_screen.dart';

class ProgressTaskListScreen extends StatefulWidget {
  const ProgressTaskListScreen({super.key});

  @override
  State<ProgressTaskListScreen> createState() => _ProgressTaskListScreenState();
}

class _ProgressTaskListScreenState extends State<ProgressTaskListScreen> {
  final GetTaskCountByStatusController _getTaskCountByStatusController =
      Get.find<GetTaskCountByStatusController>();
  final ProgressTaskListController _progressTaskListController =
      Get.find<ProgressTaskListController>();
  final DeleteTaskListController _deleteTaskListController =
      Get.find<DeleteTaskListController>();
  final UpdateTaskStatusController _updateTaskStatusController =
      Get.find<UpdateTaskStatusController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _getTaskCountByStatusController.getTaskCountByStatus();
        _progressTaskListController.getTaskList();
       // _fetchAllData();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TMAppBar(),
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTaskCardStatus(
                  _getTaskCountByStatusController.taskCountByStatusList),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GetBuilder<ProgressTaskListController>(
                    builder: (controller) {
                  return Visibility(
                      visible: controller.inProgress == false,
                      replacement: const CenterCircularProgressIndicator(),
                      child: _buildTaskListView(controller.taskList));
                }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AddNewTaskListScreen.name);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTaskCardStatus(List<TaskCountModel> taskCountByStatusList) {
    return GetBuilder<GetTaskCountByStatusController>(builder: (controller) {
      return Visibility(
        visible: controller.inProgress == false,
        replacement: const CenterCircularProgressIndicator(),
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: 70,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: taskCountByStatusList.length,
                  itemBuilder: (context, index) {
                    final TaskCountModel model = taskCountByStatusList[index];
                    return TaskCardStatusWidget(
                      title: model.sId ?? '',
                      count: model.sum.toString(),
                    );
                  }),
            )),
      );
    });
  }

  Widget _buildTaskListView(List<TaskListModel> taskList) {
    return ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          return TaskItems(
            taskModel: taskList[index],
            onDeleteTask: _deleteTask,
            onUpdateTaskStatus: _updateTaskStatus,
          );
        });
  }

  Future<void> _fetchAllData() async {
    try {
      await _getTaskCountByStatus();
      await _getProgressTaskList();
    } catch (e) {
      errorSnackBarMessage(e.toString());
    }
  }


  Future<void> _deleteTask(String id) async {
    final bool isSuccess = await _deleteTaskListController.deleteTask(id);
    if (isSuccess) {
      await _fetchAllData();
      successSnackBarMessage('Task delete successful');
    } else {
      errorSnackBarMessage(_deleteTaskListController.errorMessage!);
    }
  }

  Future<void> _updateTaskStatus(String id, String status) async {
    final bool isSuccess =
    await _updateTaskStatusController.updateTaskStatus(id, status);
    if (isSuccess) {
      await _fetchAllData();
      successSnackBarMessage('Task status updated successful');
    } else {
      errorSnackBarMessage(_updateTaskStatusController.errorMessage!);
    }
  }

  Future<void> _getTaskCountByStatus() async {
    final bool isSuccess =
    await _getTaskCountByStatusController.getTaskCountByStatus();
    if (!isSuccess) {
      errorSnackBarMessage(_getTaskCountByStatusController.errorMassage!);
    }
  }

  Future<void> _getProgressTaskList() async {
    final bool isSuccess = await _progressTaskListController.getTaskList();
    if (!isSuccess) {
      errorSnackBarMessage(_progressTaskListController.errorMassage!);
    }
  }
}