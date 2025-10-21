import 'package:embeyi/core/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:embeyi/core/component/bottom_shit/filder_bottom_shit.dart';
import 'package:embeyi/core/component/card/job_card.dart';
import 'package:embeyi/core/config/route/job_seeker_routes.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/constants/app_icons.dart';
import 'package:embeyi/core/utils/constants/app_images.dart';
import 'package:embeyi/core/utils/extensions/extension.dart';
import 'package:embeyi/features/job_seeker/home/presentation/widgets/auto_apply.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';
import '../widgets/home_widgets.dart';

class JobSeekerHomeScreen extends StatelessWidget {
  JobSeekerHomeScreen({super.key});
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Fixed Header Section (won't scroll)
            Container(
              color: AppColors.background,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: HomeHeader(
                profileImage: AppImages.profile,
                userName: 'Shakir Ahmed',
                userRole: 'UI/UX Designer',
                onNotificationTap: () {
                  // Handle notification tap
                  JobSeekerRoutes.goToNotifications();
                },
                onMessageTap: () {
                  // Handle message tap
                  JobSeekerRoutes.goToChat();
                },
                onProfileTap: () {
                  // Handle profile tap
                  JobSeekerRoutes.goToProfile();
                },
              ),
            ),

            // Scrollable Content
            Expanded(
              child: CustomScrollView(
                slivers: [
                  // Search Bar Section
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: HomeSearchBar(
                        onFilterTap: () {
                          Get.bottomSheet(
                            isScrollControlled: true,
                            FilterBottomSheet(
                              onApply: () {
                                // Handle apply tap
                              },
                              onClose: () {
                                // Handle close tap
                                Navigator.pop(context);
                              },
                            ),
                          );
                        },
                        onChanged: (value) {
                          // Handle search
                        },
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(child: 20.height),

                  // Hero Banner Section
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: HeroBanner(
                        bannerImage: AppImages.heroBanner,
                        onTap: () {
                          // Handle banner tap
                        },
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(child: 24.height),

                  // Job Category Section Header
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: SectionHeader(
                        title: 'Job Category',
                        onSeeAllTap: () {
                          // Handle see all tap
                          JobSeekerRoutes.goToAllJobCategory();
                        },
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(child: 16.height),

                  // Job Category Grid
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 4,
                        mainAxisSpacing: 10.h,
                        crossAxisSpacing: 10.w,
                        childAspectRatio: 1,
                        children: [
                          JobCategoryCard(
                            imageSrc: AppIcons.education,
                            title: 'Education',
                            onTap: () {
                              // Handle category tap
                            },
                            isJobCountVisible: false,
                          ),
                          JobCategoryCard(
                            imageSrc: AppIcons.restaurant,
                            title: 'Restaurant',
                            onTap: () {
                              // Handle category tap
                            },
                            isJobCountVisible: false,
                          ),
                          JobCategoryCard(
                            imageSrc: AppIcons.marketing,
                            title: 'Marketing',
                            onTap: () {
                              // Handle category tap
                            },
                            isJobCountVisible: false,
                          ),
                          JobCategoryCard(
                            imageSrc: AppIcons.accounting,
                            title: 'Accounting',
                            onTap: () {
                              // Handle category tap
                            },
                            isJobCountVisible: false,
                          ),
                        ],
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(child: 24.height),

                  // Recommended Job Section Header
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: SectionHeader(
                        title: 'Recommended Job',
                        onSeeAllTap: () {
                          // Handle see all tap
                          JobSeekerRoutes.goToAllRecommendedJob();
                        },
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(child: 16.height),

                  SliverToBoxAdapter(child: AutoApply()),

                  // Recommended Job List
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 16.h),
                            child: JobCard(
                              companyName: 'UX-Pilot',
                              location: 'California, United State.',
                              jobTitle: 'Sr. UI/UX Designer',
                              salaryRange: '\$7k - \$15k/month',
                              timePosted: '01 Dec 25',
                              isFullTime: true,
                              companyLogo: AppImages.jobPost,
                              showFavoriteButton: true,
                              isSaved: false,
                              onTap: () {
                                JobSeekerRoutes.goToJobDetails();
                              },
                              onFavoriteTap: () {
                                // Handle favorite tap
                              },
                            ),
                          );
                        },
                        childCount: 2, // Show 2 job cards
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(child: 20.height),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: const CommonBottomNavBar(currentIndex: 0),
      ),
    );
  }
}
