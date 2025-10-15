import 'package:embeyi/core/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:embeyi/core/component/card/job_card.dart';
import 'package:embeyi/core/config/route/job_seeker_routes.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/constants/app_images.dart';
import 'package:embeyi/core/utils/extensions/extension.dart';
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
                          // Handle filter tap
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
                            icon: Icons.school_outlined,
                            title: 'Education',
                            onTap: () {
                              // Handle category tap
                            },
                          ),
                          JobCategoryCard(
                            icon: Icons.restaurant_outlined,
                            title: 'Restaurant',
                            onTap: () {
                              // Handle category tap
                            },
                          ),
                          JobCategoryCard(
                            icon: Icons.bar_chart_outlined,
                            title: 'Marketing',
                            onTap: () {
                              // Handle category tap
                            },
                          ),
                          JobCategoryCard(
                            icon: Icons.account_balance_outlined,
                            title: 'Accounting',
                            onTap: () {
                              // Handle category tap
                            },
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
        child: const CommonBottomNavBar(currentIndex: 0, isJobSeeker: true),
      ),
    );
  }
}
