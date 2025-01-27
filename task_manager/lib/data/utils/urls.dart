class Urls {
  static const String _baseUrl = 'https://task.teamrabbil.com/api/v1';

  static const String registrationUrl = '$_baseUrl/registration';
  static const String loginUrl = '$_baseUrl/login';
  static const String createTaskUrl = '$_baseUrl/createTask';
  static const String taskCountByStatusUrl = '$_baseUrl/taskStatusCount';

  static String taskListByStatusUrl(String status) =>
      '$_baseUrl/listTaskByStatus/$status';

  static const String updateProfile = '$_baseUrl/profileUpdate';
  static String deleteTaskUrl(String id) =>
      '$_baseUrl/deleteTask/$id';

  static String updateTaskStatusUrl(String id,String status) =>
      '$_baseUrl/updateTaskStatus/$id/$status';

  static String recoverVerifyEmailUrl(String email) =>
      '$_baseUrl/RecoverVerifyEmail/$email';

  static String recoverVerifyOTPUrl(String email,String otp) =>
      '$_baseUrl/RecoverVerifyOTP/$email/$otp';
      
  static String recoverResetPassUrl='$_baseUrl/RecoverResetPass';

}