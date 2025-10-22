import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_images.dart';
import '../button/common_button.dart';
import '../image/common_image.dart';
import '../text/common_text.dart';
import '../text_field/common_text_field.dart';

class PasswordPopUp extends StatelessWidget {
  final TextEditingController? passwordController;
  final VoidCallback? onContinue;
  final VoidCallback? onSettings;

  const PasswordPopUp({
    super.key,
    this.passwordController,
    this.onContinue,
    this.onSettings,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Logo
            CommonImage(imageSrc: AppImages.logo, height: 105.h, width: 144.w),
            SizedBox(height: 16.h),

            // JOBARMAN Title

            // Subtitle
            CommonText(
              text:
                  'For Security, Enter Your Account Password\nTo Continue To Payment History.',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
            SizedBox(height: 24.h),

            // Password Label
            Align(
              alignment: Alignment.centerLeft,
              child: CommonText(
                text: 'Password',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 8.h),

            // Password TextField
            CommonTextField(
              controller: passwordController,
              hintText: '••••••••••',
              isPassword: true,
              borderRadius: 8,
              fillColor: AppColors.white,
              borderColor: AppColors.borderColor,
              textInputAction: TextInputAction.done,
            ),
            SizedBox(height: 24.h),

            // Continue Button
            CommonButton(
              titleText: 'Continue',
              onTap: onContinue ?? () => Navigator.pop(context),
              buttonRadius: 8,
              buttonHeight: 48.h,
              titleSize: 16,
              titleWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
