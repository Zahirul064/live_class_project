import 'package:get/get.dart';

import '../../data/service/network_caller.dart';
import '../../data/utills/urls.dart';

class UpdateTaskStatusController extends GetxController {
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> updateTaskStatus(String id, String status) async {
    bool isSuccess = false;
    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.updateTaskUrl(id, status),
    );

    if (response.isSuccess) {
      _errorMessage = 'Task status updated successfully';
    }
    else {
      _errorMessage=null;
    }
    return isSuccess;
  }
}
