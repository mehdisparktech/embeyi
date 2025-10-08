import 'package:embeyi/core/component/appbar/common_appbar.dart';
import 'package:embeyi/core/component/image/common_image.dart';
import 'package:embeyi/core/utils/constants/app_images.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/config/route/app_routes.dart';
import '../../../../../../core/utils/extensions/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../core/component/button/common_button.dart';
import '../../../../../../core/component/text/common_text.dart';
import '../../../../../../core/component/text_field/common_text_field.dart';
import '../controller/sign_in_controller.dart';

import '../../../../../../core/utils/constants/app_colors.dart';
import '../../../../../../core/utils/constants/app_string.dart';
import '../../../../../../core/utils/helpers/other_helper.dart';
import '../widgets/do_not_account.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColors.primaryColor,

      /// App Bar Sections Starts here
      appBar: CommonAppbar(),

      /// Body Sections Starts here
      body: GetBuilder<SignInController>(
        builder: (controller) {
          return Column(
            children: [
              const CommonText(
                text: AppString.registration,
                fontSize: 32,
                bottom: 20,
                color: AppColors.white,
              ),
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height - 195.h,
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r),
                    ),
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        24.height,
                        CommonImage(
                          imageSrc: AppImages.logo,
                          width: 144.w,
                          height: 105.h,
                        ),
                        24.height,

                        /// Account Email Input here
                        const CommonText(
                          text: AppString.email,
                          bottom: 8,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ).start,
                        CommonTextField(
                          controller: controller.emailController,

                          hintText: AppString.email,
                          validator: OtherHelper.emailValidator,
                        ),

                        /// Account Password Input here
                        const CommonText(
                          text: AppString.password,
                          bottom: 8,
                          top: 24,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ).start,
                        CommonTextField(
                          controller: controller.passwordController,

                          isPassword: true,
                          hintText: AppString.password,
                          validator: OtherHelper.passwordValidator,
                        ),

                        /// Forget Password Button here
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () => Get.toNamed(AppRoutes.forgotPassword),
                            child: const CommonText(
                              text: AppString.forgotThePassword,
                              top: 10,
                              bottom: 30,
                              color: AppColors.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        /// Submit Button here
                        CommonButton(
                          titleText: AppString.login,
                          isLoading: controller.isLoading,
                          onTap: controller.signInUser,
                        ),
                        30.height,

                        /// Account Creating Instruction here
                        const DoNotHaveAccount(),
                        30.height,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
