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
      appBar: CommonAppbar(backgroundColor: AppColors.primaryColor),

      /// Body Sections Starts here
      body: SingleChildScrollView(
        child: GetBuilder<SignInController>(
          builder: (controller) {
            return Column(
              children: [
                const CommonText(
                  text: AppString.registration,
                  fontSize: 32,
                  bottom: 20,
                  color: AppColors.white,
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
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
                        60.height,

                        /// Account Creating Instruction here
                        const DoNotHaveAccount(),
                        20.height,
                        CommonImage(imageSrc: AppImages.or),
                        40.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _socialLogin(AppImages.google, () {}),
                            16.width,
                            _socialLogin(AppImages.apple, () {}),
                            16.width,
                            _socialLogin(AppImages.linkedin, () {}),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _socialLogin(String imageSrc, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 0.76,
              color: Colors.black.withValues(alpha: 0.13),
            ),
            borderRadius: BorderRadius.circular(8.32),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x1E000000),
              blurRadius: 37.81,
              offset: Offset(15.12, 15.12),
              spreadRadius: 0,
            ),
          ],
        ),
        child: CommonImage(imageSrc: imageSrc),
      ),
    );
  }
}
