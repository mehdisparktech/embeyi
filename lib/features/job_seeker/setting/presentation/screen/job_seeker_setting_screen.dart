import 'package:embeyi/core/config/route/app_routes.dart';
import 'package:flutter/material.dart';
import '../../../../../core/config/route/job_seeker_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/component/bottom_nav_bar/common_bottom_bar.dart';
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
              children: [
                /// Change password Item here
                InkWell(
                  onTap: () => Get.toNamed(AppRoutes.changePassword),
                  child: const SettingItem(
                    title: AppString.changePassword,
                    iconDate: Icons.lock_outline,
                  ),
                ),

                /// Terms of Service Item here
                InkWell(
                  onTap: () => Get.toNamed(JobSeekerRoutes.termsOfServices),
                  child: const SettingItem(
                    title: AppString.termsOfServices,
                    iconDate: Icons.gavel,
                  ),
                ),

                /// Privacy Policy Item here
                InkWell(
                  onTap: () => Get.toNamed(JobSeekerRoutes.privacyPolicy),
                  child: const SettingItem(
                    title: AppString.privacyPolicy,
                    iconDate: Icons.network_wifi_1_bar,
                  ),
                ),

                /// Delete Account Item here
                InkWell(
                  onTap: () => deletePopUp(
                    controller: controller.passwordController,
                    onTap: controller.deleteAccountRepo,
                    isLoading: controller.isLoading,
                  ),
                  child: const SettingItem(
                    title: AppString.deleteAccount,
                    iconDate: Icons.delete_outline_rounded,
                  ),
                ),
              ],
            ),
          );
        },
      ),

      /// Bottom Navigation Bar Section starts here
      bottomNavigationBar: const CommonBottomNavBar(
        currentIndex: 0,
        isJobSeeker: true,
      ),
    );
  }
}
