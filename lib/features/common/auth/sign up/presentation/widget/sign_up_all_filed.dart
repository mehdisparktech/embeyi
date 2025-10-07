import 'package:flutter/material.dart';
import '../../../../../../core/utils/helpers/other_helper.dart';
import '../../../../../../core/utils/constants/app_string.dart';
import '../../../../../../core/component/text/common_text.dart';
import '../../../../../../core/component/text_field/common_text_field.dart';
import '../controller/sign_up_controller.dart';

class SignUpAllField extends StatelessWidget {
  const SignUpAllField({super.key, required this.controller});

  final SignUpController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// User Name here
        const CommonText(
          text: AppString.fullName,
          bottom: 8,
          top: 12,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        CommonTextField(
          hintText: AppString.fullName,
          controller: controller.nameController,
          validator: OtherHelper.validator,
        ),

        /// User Email here
        const CommonText(
          text: AppString.email,
          bottom: 8,
          top: 12,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        CommonTextField(
          controller: controller.emailController,
          hintText: AppString.email,
          validator: OtherHelper.emailValidator,
        ),

        /// User Password here
        const CommonText(
          text: AppString.password,
          bottom: 8,
          top: 12,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        CommonTextField(
          controller: controller.passwordController,
          isPassword: true,
          hintText: AppString.password,
          validator: OtherHelper.passwordValidator,
        ),

        /// User Confirm Password here
        const CommonText(
          text: AppString.confirmPassword,
          bottom: 8,
          top: 12,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        CommonTextField(
          controller: controller.confirmPasswordController,
          isPassword: true,
          hintText: AppString.confirmPassword,
          validator: (value) => OtherHelper.confirmPasswordValidator(
            value,
            controller.passwordController,
          ),
        ),
      ],
    );
  }
}
