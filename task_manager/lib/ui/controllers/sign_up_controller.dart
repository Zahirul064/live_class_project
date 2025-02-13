import 'package:get/get.dart';
import 'package:task_manager/data/utills/urls.dart';

import '../../data/service/network_caller.dart';

class SignUpController extends GetxController {
  bool _upProgress = false;

  bool get upProgress => _upProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> signUpUser(String email, String firstName, String lastName,
      String mobile, String password) async {
    bool isSuccess = false;
    _upProgress = true;
    update();

    Map<String, dynamic> requestBody = {
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
      "password": password,
      "photo": ""
    };

    final NetworkResponse response =
        await NetworkCaller.postRequest(url: Urls.signUpUrl, body: requestBody);
    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }
    _upProgress = false;
    update();
    return isSuccess;
  }
}
