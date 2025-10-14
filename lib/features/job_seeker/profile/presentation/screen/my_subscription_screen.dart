import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/component/text/common_text.dart';
import '../../../../../core/component/button/common_button.dart';
import '../../../../../core/utils/extensions/extension.dart';

class MySubscriptionScreen extends StatelessWidget {
  const MySubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CommonText(
          text: 'My Subscription',
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Current Plan Card
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary,
                        AppColors.primary.withOpacity(0.7),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: AppColors.white, size: 24.sp),
                          8.width,
                          CommonText(
                            text: 'Premium Plan',
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                      16.height,
                      CommonText(
                        text: 'Active',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white.withOpacity(0.9),
                      ),
                      4.height,
                      CommonText(
                        text: '\$19.99/month',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                      16.height,
                      Divider(color: AppColors.white.withOpacity(0.3)),
                      16.height,
                      _buildInfoRow('Start Date:', 'January 1, 2025'),
                      8.height,
                      _buildInfoRow('Next Billing:', 'February 1, 2025'),
                      8.height,
                      _buildInfoRow('Auto Renewal:', 'Enabled'),
                    ],
                  ),
                ),
                24.height,

                /// Usage Stats
                const CommonText(
                  text: 'Usage Statistics',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                16.height,
                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        'Job Applications',
                        '45',
                        'Unlimited',
                        Icons.work,
                      ),
                    ),
                    12.width,
                    Expanded(
                      child: _buildStatCard(
                        'Profile Views',
                        '230',
                        'This month',
                        Icons.visibility,
                      ),
                    ),
                  ],
                ),
                24.height,

                /// Plan Benefits
                const CommonText(
                  text: 'Plan Benefits',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                16.height,
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    children: [
                      _buildBenefitItem('Unlimited job applications'),
                      _buildBenefitItem('Top profile visibility'),
                      _buildBenefitItem('Instant job alerts'),
                      _buildBenefitItem('24/7 Premium support'),
                      _buildBenefitItem('Advanced resume builder'),
                      _buildBenefitItem('Interview preparation'),
                      _buildBenefitItem('Career counseling', isLast: true),
                    ],
                  ),
                ),
                32.height,

                /// Action Buttons
                CommonButton(titleText: 'Upgrade Plan', onTap: () {}),
                16.height,
                CommonButton(
                  titleText: 'Cancel Subscription',
                  onTap: () {
                    // Show confirmation dialog
                  },
                  buttonColor: AppColors.error,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CommonText(
          text: label,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.white.withOpacity(0.9),
        ),
        CommonText(
          text: value,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
      ],
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    String subtitle,
    IconData icon,
  ) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primary, size: 28.sp),
          12.height,
          CommonText(
            text: value,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
          ),
          4.height,
          CommonText(text: title, fontSize: 12, fontWeight: FontWeight.w500),
          4.height,
          CommonText(
            text: subtitle,
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: AppColors.secondaryText,
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitItem(String text, {bool isLast = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 12.h),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: AppColors.success, size: 20.sp),
          12.width,
          Expanded(
            child: CommonText(
              text: text,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
