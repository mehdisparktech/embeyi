import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/component/button/common_button.dart';
import '../../core/component/pop_up/otp_pop_up.dart';
import '../../core/component/pop_up/password_pop_up.dart';
import '../../core/utils/constants/app_colors.dart';

class PopUpExampleScreen extends StatefulWidget {
  const PopUpExampleScreen({super.key});

  @override
  State<PopUpExampleScreen> createState() => _PopUpExampleScreenState();
}

class _PopUpExampleScreenState extends State<PopUpExampleScreen> {
  final TextEditingController passwordController = TextEditingController();
  final List<TextEditingController> otpControllers =
      List.generate(6, (index) => TextEditingController());

  @override
  void dispose() {
    passwordController.dispose();
    for (var controller in otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _showPasswordPopUp() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => PasswordPopUp(
        passwordController: passwordController,
        onContinue: () {
          // Handle password submission
          String password = passwordController.text;
          print('Password entered: $password');
          Navigator.pop(context);
          // Navigate to next screen or perform action
        },
      ),
    );
  }

  void _showOtpPopUp() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => OtpPopUp(
        controllers: otpControllers,
        onVerify: () {
          // Handle OTP verification
          String otp =
              otpControllers.map((controller) => controller.text).join();
          print('OTP entered: $otp');
          Navigator.pop(context);
          // Verify OTP with backend
        },
        onResend: () {
          // Handle resend OTP
          print('Resending OTP...');
          // Clear previous OTP
          for (var controller in otpControllers) {
            controller.clear();
          }
          // Call API to resend OTP
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Pop-up Examples'),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Password Pop-up Button
            CommonButton(
              titleText: 'Show Password Pop-up',
              onTap: _showPasswordPopUp,
              buttonRadius: 8,
              buttonHeight: 48.h,
            ),
            SizedBox(height: 24.h),

            // OTP Pop-up Button
            CommonButton(
              titleText: 'Show OTP Pop-up',
              onTap: _showOtpPopUp,
              buttonRadius: 8,
              buttonHeight: 48.h,
            ),
          ],
        ),
      ),
    );
  }
}
