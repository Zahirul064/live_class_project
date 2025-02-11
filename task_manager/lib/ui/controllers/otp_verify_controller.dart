import 'package:get/get.dart';

import '../../data/service/network_caller.dart';
import '../../data/utills/urls.dart';

class OTPVerifyController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> otpVerify(email, String otp) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.getRequest(
        url: Urls.forgetVerifyOtpUrl(email , otp));
    if (response.responseData!['status'] == 'success') {
      email;
      otp;
      isSuccess = true;
      _errorMessage=null;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress=false;
    update();
    return isSuccess;
  }
}