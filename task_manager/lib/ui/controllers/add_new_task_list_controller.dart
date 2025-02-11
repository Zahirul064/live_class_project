import 'package:get/get.dart';

import '../../data/service/network_caller.dart';
import '../../data/utills/urls.dart';

class AddNewTaskListController extends GetxController{
   bool _inProgress = false;

   bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;


  Future<bool> createNewTask(String title, String description) async {
    bool isSuccess = false;
    _inProgress=true;
    update();
    Map<String, dynamic> requestBody = {
      "title": title,
      "description": description,
      "status": "New",
    };

    final NetworkResponse response = await NetworkCaller.postRequest(
        url: Urls.createTaskUrl, body: requestBody);
    _inProgress=false;
    update();
    if(response.isSuccess){
     _errorMessage = 'New task added!';
     isSuccess=true;
    }else{
      _errorMessage = response.errorMessage;
    }
    return isSuccess;
  }
}