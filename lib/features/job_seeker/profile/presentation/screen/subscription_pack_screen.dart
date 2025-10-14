import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/component/text/common_text.dart';
import '../../../../../core/component/button/common_button.dart';
import '../../../../../core/utils/extensions/extension.dart';

class SubscriptionPackScreen extends StatelessWidget {
  const SubscriptionPackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CommonText(
          text: 'Subscription Packs',
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
                const CommonText(
                  text: 'Choose Your Plan',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                8.height,
                CommonText(
                  text: 'Select the best plan that suits your needs',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondaryText,
                ),
                24.height,

                /// Free Plan
                _buildPlanCard(
                  title: 'Free',
                  price: '\$0',
                  period: '/month',
                  features: [
                    'Apply to 5 jobs per month',
                    'Basic profile',
                    'Limited job alerts',
                    'Standard support',
                  ],
                  isRecommended: false,
                  isCurrent: false,
                ),
                16.height,

                /// Basic Plan
                _buildPlanCard(
                  title: 'Basic',
                  price: '\$9.99',
                  period: '/month',
                  features: [
                    'Apply to 20 jobs per month',
                    'Enhanced profile visibility',
                    'Job alerts',
                    'Priority support',
                    'Resume builder',
                  ],
                  isRecommended: false,
                  isCurrent: false,
                ),
                16.height,

                /// Premium Plan
                _buildPlanCard(
                  title: 'Premium',
                  price: '\$19.99',
                  period: '/month',
                  features: [
                    'Unlimited job applications',
                    'Top profile visibility',
                    'Instant job alerts',
                    '24/7 Premium support',
                    'Advanced resume builder',
                    'Interview preparation',
                    'Career counseling',
                  ],
                  isRecommended: true,
                  isCurrent: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlanCard({
    required String title,
    required String price,
    required String period,
    required List<String> features,
    required bool isRecommended,
    required bool isCurrent,
  }) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isRecommended ? AppColors.primary : AppColors.border,
          width: isRecommended ? 2 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isRecommended)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: CommonText(
                text: 'RECOMMENDED',
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          if (isRecommended) 12.height,
          Row(
            children: [
              Expanded(
                child: CommonText(
                  text: title,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (isCurrent)
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.success.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(color: AppColors.success),
                  ),
                  child: CommonText(
                    text: 'Current Plan',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.success,
                  ),
                ),
            ],
          ),
          8.height,
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CommonText(
                text: price,
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
              CommonText(
                text: period,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.secondaryText,
              ),
            ],
          ),
          24.height,
          ...features.map(
            (feature) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: AppColors.success,
                    size: 20.sp,
                  ),
                  12.width,
                  Expanded(
                    child: CommonText(
                      text: feature,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          24.height,
          CommonButton(
            titleText: isCurrent ? 'Current Plan' : 'Choose Plan',
            onTap: isCurrent ? null : () {},
            buttonColor: isCurrent
                ? AppColors.secondaryText
                : AppColors.primary,
          ),
        ],
      ),
    );
  }
}
