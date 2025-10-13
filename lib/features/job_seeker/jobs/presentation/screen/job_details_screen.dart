import 'package:embeyi/core/component/appbar/common_appbar.dart';
import 'package:embeyi/core/component/button/common_button.dart';
import 'package:embeyi/core/config/route/job_seeker_routes.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../widgets/job_details_widgets.dart';

class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppbar(
        title: 'Job Description',
        backgroundColor: AppColors.primaryColor,
        textColor: AppColors.white,
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Hero Card - Green Hiring Banner
                    const JobHeroCard(
                      title: 'Hiring',
                      subtitle: 'uniUX Designer',
                    ),

                    20.height,

                    // Job Title Section
                    const JobTitleSection(
                      jobTitle: 'Senior UI/UX Designer',
                      location:
                          '2IR Thermings Cir, Syracuse, Connecticut, 38024',
                      salary: '\$40,000 - \$80,000',
                    ),

                    16.height,

                    // Job Info Tags
                    const JobInfoTags(
                      isFullTime: true,
                      experience: '2 Yrs+ Experience',
                      postedDate: '3 Days Ago',
                      endDate: '31 Dec',
                    ),

                    16.height,

                    // Job Dates
                    const JobDatesWidget(
                      postedDate: '3 Days Ago',
                      endDate: '31 Dec',
                    ),

                    20.height,

                    // Divider
                    Divider(
                      color: AppColors.borderColor.withOpacity(0.3),
                      thickness: 1,
                    ),

                    16.height,

                    // Company Info
                    const JobDetailsSectionHeader(
                      title: 'Your Profile Will Match With This Job',
                    ),

                    12.height,

                    CompanyInfoCard(
                      companyName: 'Design-Hill',
                      onTap: () {
                        Get.toNamed(JobSeekerRoutes.companyOverview);
                      },
                    ),

                    20.height,

                    // Job Description Section
                    const JobDetailsSectionHeader(title: 'Job Description'),

                    12.height,

                    const DescriptionText(
                      text:
                          'We Are Google Partner And A Corp Certified Agency Focused On One Thing: Delivering Results.',
                    ),

                    16.height,

                    const DescriptionText(
                      text:
                          'Over The Past 10 Years, We\'ve Helped 250+ Clients Show Up Through High-Performing Websites, Social Content, And Engaging Campaigns That Reduce Cart Abandonment And Helped Our Clients Sell Millions In Products And Services.',
                    ),

                    16.height,

                    const DescriptionText(
                      text:
                          'Award-Winning Work That\'s Done 100% In An In-House Studio',
                    ),

                    16.height,

                    const DescriptionText(text: 'Strategic, Clean, Effective'),

                    16.height,

                    const DescriptionText(
                      text: 'Field Service Packages Built For Scale',
                    ),

                    20.height,

                    // Requirements Section
                    const JobDetailsSectionHeader(
                      title:
                          'We Don\'t Just Talk About High-Performance Marketing',
                    ),

                    12.height,

                    const RequirementItem(
                      text:
                          'LinkedIn: https://www.linkedin.com/Company/Seriousmarketing/',
                    ),

                    16.height,

                    // LinkedIn Link
                    const LinkWidget(
                      title: 'LinkedIn Profile',
                      url: 'https://www.linkedin.com/Company/Seriousmarketing/',
                      icon: Icons.link,
                    ),

                    16.height,

                    // Application Instructions
                    const JobDetailsSectionHeader(
                      title:
                          'To Move Forward With Your Application, Please Connect With Us On LinkedIn:',
                    ),

                    12.height,

                    const LinkWidget(
                      title: 'https://www.linkedin.com/in/Liecybets',
                      url: 'https://www.linkedin.com/in/Liecybets',
                      icon: Icons.link,
                    ),

                    24.height,
                  ],
                ),
              ),
            ),
          ),

          // Bottom Apply Button
          Container(
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: SafeArea(
              top: false,
              child: CommonButton(
                titleText: 'Apply Now',
                buttonRadius: 8,
                onTap: () {
                  // Handle apply action
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
