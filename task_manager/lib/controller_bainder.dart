import 'package:get/get.dart';
import 'package:task_manager/ui/controllers/add_new_task_list_controller.dart';
import 'package:task_manager/ui/controllers/cancel_task_list_controller.dart';
import 'package:task_manager/ui/controllers/complete_task_list_controller.dart';
import 'package:task_manager/ui/controllers/delete_task_list_controller.dart';
import 'package:task_manager/ui/controllers/email_verify_controller.dart';
import 'package:task_manager/ui/controllers/getTaskCountByStatusController.dart';
import 'package:task_manager/ui/controllers/main_bottom_nav_controller.dart';
import 'package:task_manager/ui/controllers/new_task_list_controller.dart';
import 'package:task_manager/ui/controllers/otp_verify_controller.dart';
import 'package:task_manager/ui/controllers/progress_task_list_controller.dart';
import 'package:task_manager/ui/controllers/reset_password_controller.dart';
import 'package:task_manager/ui/controllers/sign_in_controller.dart';
import 'package:task_manager/ui/controllers/sign_up_controller.dart';
import 'package:task_manager/ui/controllers/update_profile_controller.dart';
import 'package:task_manager/ui/controllers/update_task_status_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
    Get.lazyPut(() => SignUpController());
    Get.lazyPut(() => AddNewTaskListController());
    Get.put(NewTaskListController());
    Get.lazyPut(() => ProgressTaskListController());
    Get.lazyPut(() => CompleteTaskLIstController());
    Get.lazyPut(() => CancelTaskListController());
    Get.put(GetTaskCountByStatusController());
    Get.lazyPut(() => DeleteTaskListController());
    Get.lazyPut(() => UpdateTaskStatusController());
    Get.lazyPut(() => EmailVerifyController());
    Get.lazyPut(() => OTPVerifyController());
    Get.lazyPut(() => ResetPasswordController());
    Get.lazyPut(() => UpdateProfileController());
    Get.lazyPut(() => MainBottomNavController());
    //Get.put(MainBottomNavController());
  }
}
