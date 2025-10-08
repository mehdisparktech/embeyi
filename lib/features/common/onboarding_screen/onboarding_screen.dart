import 'package:embeyi/core/component/button/common_button.dart';
import 'package:embeyi/core/component/text/common_text.dart';
import 'package:embeyi/core/config/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/extensions/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/constants/app_images.dart';
import '../../../core/utils/constants/app_string.dart';
import '../../../core/component/image/common_image.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            180.height,
            const Center(child: CommonImage(imageSrc: AppImages.onboarding)),
            120.height,
            CommonText(
              text: AppString.onboardingHeadingText,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
            20.height,
            CommonText(
              text: AppString.onboardingSubText,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
            Spacer(),
            CommonButton(
              titleText: 'Get Started',
              onTap: () {
                Get.toNamed(AppRoutes.selectedRole);
              },
            ),
            20.height,
          ],
        ),
      ),
    );
  }
}
