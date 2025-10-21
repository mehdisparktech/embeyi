import 'package:embeyi/core/config/route/app_routes.dart';
import 'package:embeyi/core/utils/constants/app_icons.dart';
import 'package:flutter/material.dart';
import '../../../../../core/config/route/job_seeker_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/component/pop_up/common_pop_menu.dart';
import '../../../../../core/component/text/common_text.dart';
import '../controller/setting_controller.dart';
import '../../../../../core/utils/constants/app_string.dart';
import '../widgets/setting_item.dart';

class JobSeekerSettingScreen extends StatelessWidget {
  const JobSeekerSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar Section starts here
      appBar: AppBar(
        centerTitle: true,
        title: const CommonText(
          text: AppString.settings,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),

      /// Body Section starts here
      body: GetBuilder<SettingController>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              spacing: 16.h,
              children: [
                /// Change password Item here
                SettingItem(
                  title: AppString.changePassword,
                  imageSrc: AppIcons.edit,
                  onTap: () => AppRoutes.goToChangePassword(),
                ),

                /// Privacy Policy Item here
                SettingItem(
                  title: AppString.privacyPolicy,
                  imageSrc: AppIcons.privacy,
                  onTap: () => JobSeekerRoutes.goToPrivacyPolicy(),
                ),

                /// Terms of Service Item here
                SettingItem(
                  title: AppString.termsOfServices,
                  imageSrc: AppIcons.terms,
                  onTap: () => JobSeekerRoutes.goToTermsOfServices(),
                ),

                /// Privacy Policy Item here
                SettingItem(
                  title: AppString.helpAndSupport,
                  imageSrc: AppIcons.support,
                  onTap: () => JobSeekerRoutes.goToHelpAndSupport(),
                ),

                /// Delete Account Item here
                SettingItem(
                  title: AppString.deleteAccount,
                  imageSrc: AppIcons.deleteAccount,
                  onTap: () => deletePopUp(
                    controller: controller.passwordController,
                    onTap: controller.deleteAccountRepo,
                    isLoading: controller.isLoading,
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
