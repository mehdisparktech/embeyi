import 'package:embeyi/core/component/appbar/common_appbar.dart';
import 'package:embeyi/core/component/image/common_image.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/constants/app_images.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/utils/extensions/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../core/component/button/common_button.dart';
import '../../../../../../core/component/text/common_text.dart';
import '../controller/sign_up_controller.dart';
import '../../../../../../core/utils/constants/app_string.dart';
import '../widget/already_accunt_rich_text.dart';
import '../widget/sign_up_all_filed.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpFormKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColors.primaryColor,

      /// App Bar Section Starts Here
      appBar: CommonAppbar(),

      /// Body Section Starts Here
      body: GetBuilder<SignUpController>(
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
                    key: signUpFormKey,
                    child: Column(
                      children: [
                        CommonImage(
                          imageSrc: AppImages.logo,
                          width: 144.w,
                          height: 105.h,
                        ),

                        /// All Text Filed here
                        SignUpAllField(controller: controller),

                        16.height,

                        /// Submit Button Here
                        CommonButton(
                          titleText: AppString.signUp,
                          isLoading: controller.isLoading,
                          onTap: controller.signUpUser,
                        ),
                        24.height,

                        ///  Sign In Instruction here
                        const AlreadyAccountRichText(),
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
