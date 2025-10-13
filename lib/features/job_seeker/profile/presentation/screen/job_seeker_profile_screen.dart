import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:embeyi/core/services/storage/storage_keys.dart';
import '../../../../../core/component/bottom_nav_bar/common_bottom_bar.dart';
import '../../../../../core/component/image/common_image.dart';
import '../../../../../core/component/other_widgets/item.dart';
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
          return SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
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
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: profileItems.length,
                      itemBuilder: (context, index) {
                        final item = profileItems[index];
                        return Item(
                          icon: item.icon,
                          title: item.title,
                          onTap: item.onTap,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),

      /// Bottom Navigation Bar Section Starts here
      bottomNavigationBar: SafeArea(
        child: const CommonBottomNavBar(currentIndex: 3, isJobSeeker: true),
      ),
    );
  }
}

// Profile Item Data
final List<ProfileItemData> profileItems = [
  ProfileItemData(
    icon: Icons.person_outline,
    title: 'My Profile',
    onTap: () {},
  ),
  ProfileItemData(
    icon: Icons.description_outlined,
    title: 'Resume',
    onTap: () {},
  ),
  ProfileItemData(
    icon: Icons.favorite_border,
    title: 'Favorite List',
    onTap: () {},
  ),
  ProfileItemData(
    icon: Icons.subscriptions,
    title: 'Subscription Pack',
    onTap: () {},
  ),
  ProfileItemData(
    icon: Icons.credit_card,
    title: 'My Subscription',
    onTap: () {},
  ),
  ProfileItemData(icon: Icons.payment, title: 'Payment History', onTap: () {}),
  ProfileItemData(
    icon: Icons.star_border,
    title: 'Platform Review',
    onTap: () {},
  ),
  ProfileItemData(icon: Icons.settings, title: 'Settings', onTap: () {}),
  ProfileItemData(icon: Icons.logout, title: 'Log Out', onTap: () {}),
];

// Profile Item Model
class ProfileItemData {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  ProfileItemData({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}
