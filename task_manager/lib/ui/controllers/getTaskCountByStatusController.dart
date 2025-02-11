import 'package:get/get.dart';
import 'package:task_manager/data/models/task_count_by_status_model.dart';
import 'package:task_manager/data/models/task_count_model.dart';
import '../../data/service/network_caller.dart';
import '../../data/utills/urls.dart';

class GetTaskCountByStatusController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String? _errorMessage;

  String? get errorMassage => _errorMessage;

  TaskCountByStatusModel? _taskCountByStatusModel;
  List<TaskCountModel> get taskCountByStatusList => _taskCountByStatusModel?.taskCountByStatusList ?? [];

  Future<bool> getTaskCountByStatus() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.taskCountByStatusUrl,
    );

    if (response.isSuccess) {
      _taskCountByStatusModel =
          TaskCountByStatusModel.fromJson(response.responseData!);
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
