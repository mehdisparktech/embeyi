import 'package:embeyi/core/component/appbar/common_appbar.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../core/utils/extensions/extension.dart';
import '../../../../../../core/component/button/common_button.dart';
import '../../../../../../core/component/image/common_image.dart';
import '../../../../../../core/component/text/common_text.dart';
import '../../../../../../core/component/text_field/common_text_field.dart';
import '../controller/forget_password_controller.dart';
import '../../../../../../core/utils/constants/app_string.dart';
import '../../../../../../core/utils/helpers/other_helper.dart';

class CreatePassword extends StatelessWidget {
  CreatePassword({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,

      /// App Bar Section starts here
      appBar: CommonAppbar(
        backgroundColor: AppColors.primaryColor,
        leading: const BackButton(color: AppColors.white),
      ),

      /// Body Section starts here
      body: GetBuilder<ForgetPasswordController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const CommonText(
                  text: AppString.setNewPassword,
                  fontSize: 30,
                  bottom: 20,
                  color: AppColors.white,
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          /// Reset password image here
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: CommonImage(
                                imageSrc: AppIcons.resetPassword,
                                height: 297,
                                width: 297,
                              ),
                            ),
                          ),

                          /// Instruction of Creating New Password
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: const CommonText(
                              text:
                                  'Create a strong new password to secure your account',

                              fontSize: 18,
                              bottom: 14,
                              maxLines: 2,
                            ).center,
                          ),

                          /// New Password here
                          const CommonText(
                            text: AppString.password,
                            bottom: 8,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ).start,
                          CommonTextField(
                            controller: controller.passwordController,

                            hintText: AppString.password,
                            isPassword: true,
                            validator: OtherHelper.passwordValidator,
                          ),

                          /// Confirm Password here
                          const CommonText(
                            text: AppString.confirmPassword,
                            bottom: 8,
                            top: 16,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ).start,
                          CommonTextField(
                            controller: controller.confirmPasswordController,

                            hintText: AppString.confirmPassword,
                            validator: (value) =>
                                OtherHelper.confirmPasswordValidator(
                                  value,
                                  controller.passwordController,
                                ),
                            isPassword: true,
                          ).start,
                          20.height,

                          /// Submit Button here
                          CommonButton(
                            titleText: AppString.continues,
                            isLoading: controller.isLoadingReset,
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                controller.resetPasswordRepo();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
