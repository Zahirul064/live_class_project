import 'package:get/get.dart';
import '../../data/service/network_caller.dart';
import '../../data/utills/urls.dart';

class DeleteTaskListController extends GetxController {
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> deleteTask(String id) async {
    bool isSuccess = false;
    final NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.deleteTaskItemUrl(id));

    if (response.isSuccess) {
      _errorMessage = 'Task delete successful';
    }
    else {
      _errorMessage=null;
    }
    return isSuccess;
  }
}
