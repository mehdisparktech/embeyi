import 'package:embeyi/core/component/appbar/common_appbar.dart';
import 'package:embeyi/core/component/button/common_button.dart';
import 'package:embeyi/core/component/image/common_image.dart';
import 'package:embeyi/core/component/pop_up/job_apply_popup.dart';
import 'package:embeyi/core/component/pop_up/success_dialog.dart';
import 'package:embeyi/core/component/text/common_text.dart';
import 'package:embeyi/core/config/route/job_seeker_routes.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/constants/app_images.dart';
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
      backgroundColor: AppColors.surfaceBackground,
      appBar: CommonAppbar(title: 'Job Description', centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonImage(
                      imageSrc: AppImages.jobDetails,
                      fill: BoxFit.cover,
                      height: 220.h,
                      width: double.infinity,
                    ),

                    // Hero Card - Green Hiring Banner
                    // const JobHeroCard(
                    //   title: 'Hiring',
                    //   subtitle: 'uniUX Designer',
                    // ),
                    20.height,

                    Container(
                      padding: EdgeInsets.all(16.r),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x19000000),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Job Title Section
                          const JobTitleSection(
                            jobTitle: 'Senior UI/UX Designer',
                            location:
                                '2IR Thermings Cir, Syracuse, Connecticut, 38024',
                            salary: '\$40,000 - \$80,000',
                          ),

                          10.height,

                          // Job Info Tags
                          const JobInfoTags(
                            isFullTime: true,
                            experience: '2 Yrs+ Experience',
                            postedDate: '3 Days Ago',
                            endDate: '31 Dec',
                          ),

                          10.height,

                          // Job Dates
                          // const JobDatesWidget(
                          //   postedDate: '3 Days Ago',
                          //   endDate: '31 Dec',
                          // ),

                          // 20.height,

                          // Divider
                          // Divider(
                          //   color: AppColors.borderColor.withOpacity(0.3),
                          //   thickness: 1,
                          // ),

                          // 16.height,

                          // Company Info
                          const JobDetailsSectionHeader(
                            title: 'Posted 3 Days Ago,  end Date 31 Dec.',
                            color: AppColors.secondaryText,
                          ),
                          8.height,
                          const JobDetailsSectionHeader(
                            title: 'Your Profile Matches 90% with this Job',
                          ),

                          12.height,

                          CompanyInfoCard(
                            companyName: 'Design-Hill',
                            onTap: () {
                              Get.toNamed(JobSeekerRoutes.companyOverview);
                            },
                          ),

                          20.height,
                        ],
                      ),
                    ),

                    16.height,
                    CommonText(
                      text: 'Job Description',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                      bottom: 10,
                    ).start,

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
                    const DescriptionText(
                      text:
                          'We Don\'t Just Talk About High-Performance Marketing',
                    ),

                    12.height,

                    const DescriptionText(
                      text:
                          'LinkedIn: www.linkedin.com/Company/Seriousmarketing/',
                    ),

                    // LinkedIn Link
                    16.height,

                    // Application Instructions
                    const DescriptionText(
                      text:
                          'To move forward with your application, please connect with me on LinkedIn and share your responses there: linkedin.com/in/lizclaydb.',
                    ),

                    12.height,

                    24.height,
                  ],
                ),
              ),
            ),
          ),

          // Bottom Apply Button
          Container(
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(color: AppColors.surfaceBackground),
            child: SafeArea(
              top: false,
              child: CommonButton(
                titleText: 'Apply Now',
                buttonRadius: 8,
                onTap: () {
                  // Handle apply action
                  showDialog(
                    context: context,
                    builder: (context) => JobApplyPopup(
                      jobTitle: 'Sr. UI/UX Designer',
                      companyName: 'Design-Hill',
                      companyLogo: AppImages.jobDetails,
                      location: 'California, Connecticut',
                      deadline: '31 Dec 25',
                      isFullTime: true,
                      isRemote: false,
                      companyDescription:
                          'We Are Google Partner And A Corp Certified Agency Focused On One Thing: Delivering Results.',
                      onApply: () {
                        SuccessDialog.showApplicationSuccess(
                          message:
                              'Your application has been Successful. We’ll keep you updated.',
                          buttonText: 'Done',
                          onBackToHome: () => Get.back(),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
