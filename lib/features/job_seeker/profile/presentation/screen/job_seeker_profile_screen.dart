import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:embeyi/core/services/storage/storage_keys.dart';
import '../../../../../core/config/route/job_seeker_routes.dart';
import '../../../../../core/component/bottom_nav_bar/common_bottom_bar.dart';
import '../../../../../core/component/image/common_image.dart';
import '../../../../../core/component/other_widgets/item.dart';
import '../../../../../core/component/pop_up/common_pop_menu.dart';
import '../../../../../core/component/text/common_text.dart';
import '../controller/profile_controller.dart';
import '../../../../../core/utils/constants/app_images.dart';
import '../../../../../core/utils/constants/app_string.dart';

class JobSeekerProfileScreen extends StatelessWidget {
  const JobSeekerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar Section Starts here
      appBar: AppBar(
        centerTitle: true,
        title: const CommonText(
          text: AppString.profile,
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),
        leading: const SizedBox(),
      ),

      /// Body Section Starts here
      body: GetBuilder<ProfileController>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              children: [
                /// User Profile Image here
                Center(
                  child: CircleAvatar(
                    radius: 50.sp,
                    backgroundColor: Colors.transparent,
                    child: const ClipOval(
                      child: CommonImage(
                        imageSrc: AppImages.profile,
                        size: 100,
                        defaultImage: AppImages.profile,
                      ),
                    ),
                  ),
                ),

                /// User Name here
                const CommonText(
                  text: LocalStorageKeys.myName,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  top: 16,
                  bottom: 4,
                ),
                CommonText(
                  text: "UI/UX Designer",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondaryText,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    Icon(Icons.star, color: AppColors.secondaryPrimary),
                    8.width,
                    CommonText(
                      text: 'Premium Plan',
                      textAlign: TextAlign.center,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.secondaryPrimary,
                    ),
                  ],
                ),
                16.height,

                /// Edit Profile item here
                Item(
                  icon: Icons.person,
                  title: AppString.editProfile,
                  onTap: () => Get.toNamed(JobSeekerRoutes.editProfile),
                ),

                /// Setting item here
                Item(
                  icon: Icons.settings,
                  title: AppString.settings,
                  onTap: () => Get.toNamed(JobSeekerRoutes.setting),
                ),

                /// Log Out item here
                Item(
                  icon: Icons.logout,
                  title: AppString.logOut,
                  onTap: logOutPopUp,
                ),
              ],
            ),
          );
        },
      ),

      /// Bottom Navigation Bar Section Starts here
      bottomNavigationBar: const CommonBottomNavBar(
        currentIndex: 3,
        isJobSeeker: true,
      ),
    );
  }
}
