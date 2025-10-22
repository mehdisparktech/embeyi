import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constants/app_colors.dart';
import '../button/common_button.dart';
import '../text/common_text.dart';

class OtpPopUp extends StatefulWidget {
  final VoidCallback? onVerify;
  final VoidCallback? onResend;
  final List<TextEditingController>? controllers;

  const OtpPopUp({super.key, this.onVerify, this.onResend, this.controllers});

  @override
  State<OtpPopUp> createState() => _OtpPopUpState();
}

class _OtpPopUpState extends State<OtpPopUp> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers =
        widget.controllers ??
        List.generate(4, (index) => TextEditingController());
    _focusNodes = List.generate(_controllers.length, (index) => FocusNode());
  }

  @override
  void dispose() {
    if (widget.controllers == null) {
      for (var controller in _controllers) {
        controller.dispose();
      }
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.length == 1 && index < _controllers.length - 1) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

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
            // OTP Verification Title
            CommonText(
              text: 'OTP Verification',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),

            // Subtitle
            CommonText(
              text:
                  'Enter The 4-Digit Code We Sent To\nYour Email To Verify Your Payment.',
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
            SizedBox(height: 32.h),

            // OTP Input Boxes
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _controllers.length,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: _buildOtpBox(index),
                ),
              ),
            ),
            SizedBox(height: 24.h),

            // Resend Text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonText(
                  text: "Didn't receive a code? ",
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey,
                  textAlign: TextAlign.center,
                ),
                GestureDetector(
                  onTap: widget.onResend,
                  child: CommonText(
                    text: 'Resend',
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),

            // Verify Button
            CommonButton(
              titleText: 'Verify',
              onTap: widget.onVerify ?? () => Navigator.pop(context),
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

  Widget _buildOtpBox(int index) {
    return Container(
      width: 45.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.primaryColor, width: 1.5),
      ),
      child: TextFormField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: (value) => _onChanged(value, index),
      ),
    );
  }
}
