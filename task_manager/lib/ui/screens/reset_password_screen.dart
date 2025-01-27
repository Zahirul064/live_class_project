import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/app.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/controllers/auth_controller.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/utils/app_colors.dart';
import 'package:task_manager/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  static const String name = '/forgot-password/reset-password';

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _newPasswordTEController =
      TextEditingController();
  final TextEditingController _confirmPasswordTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _progressStatus = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  Text('Set Password', style: textTheme.titleLarge),
                  const SizedBox(height: 4),
                  Text(
                    'Minimum length of password should be more than 8 letters.',
                    style: textTheme.titleSmall,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _newPasswordTEController,
                    decoration: const InputDecoration(hintText: 'New Password'),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _confirmPasswordTEController,
                    decoration:
                        const InputDecoration(hintText: 'Confirm New Password'),
                  ),
                  const SizedBox(height: 24),
                  Visibility(
                    visible: _progressStatus == false,
                    replacement: const CenteredCircularProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_validatePasswords()) {
                          if (await _resetPassword()) {
                            Navigator.pushNamedAndRemoveUntil(
                                TaskManagerApp.navigatorKey.currentContext!,
                                SignInScreen.name,
                                (value) => false);
                          }
                        } else {
                          showSnackBarMessage(
                              TaskManagerApp.navigatorKey.currentContext!,
                              'Password didn' 't match.');
                        }
                      },
                      child: const Text('Confirm'),
                    ),
                  ),
                  const SizedBox(height: 48),
                  Center(
                    child: _buildSignInSection(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool _validatePasswords() {
    // If passwords do not match, set error message
    if (_newPasswordTEController.text != _confirmPasswordTEController.text) {
      return false;
    } else {
      return true;
    }
  }

  Widget _buildSignInSection() {
    return RichText(
      text: TextSpan(
        text: "Have an account? ",
        style:
            const TextStyle(color: Colors.black54, fontWeight: FontWeight.w600),
        children: [
          TextSpan(
            text: 'Sign in',
            style: const TextStyle(
              color: AppColors.themeColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                Navigator.pushNamedAndRemoveUntil(
                    context, SignInScreen.name, (value) => false);
              },
          )
        ],
      ),
    );
  }

  Future<bool> _resetPassword() async {
    bool _isSuccess = false;
    _progressStatus = true;
    setState(() {});
    Map<String, dynamic> requestBody = {
      "email": AuthController.userEmail,
      "OTP": AuthController.userOTP,
      "password": _newPasswordTEController.text
    };
    final NetworkResponse response = await NetworkCaller.postRequest(
        url: Urls.recoverResetPassUrl, body: requestBody);
    _progressStatus = false;
    setState(() {});
    if (response.isSuccess &&
        response.status.toLowerCase().contains('success')) {
      _isSuccess = true;
      showSnackBarMessage(TaskManagerApp.navigatorKey.currentContext!,
          'Password changed successfully.');
    } else {
      showSnackBarMessage(
          TaskManagerApp.navigatorKey.currentContext!, response.errorMessage);
    }
    return _isSuccess;
  }

  @override
  void dispose() {
    _newPasswordTEController.dispose();
    _confirmPasswordTEController.dispose();
    super.dispose();
  }
}
