import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/component/text/common_text.dart';
import '../../../../../core/utils/extensions/extension.dart';

class PaymentHistoryScreen extends StatelessWidget {
  const PaymentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CommonText(
          text: 'Payment History',
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          physics: const BouncingScrollPhysics(),
          itemCount: 8,
          separatorBuilder: (context, index) => 16.height,
          itemBuilder: (context, index) {
            final isSuccess = index % 3 != 2;
            return _buildPaymentCard(
              transactionId: 'TXN${100001 + index}',
              date: 'Jan ${25 - index}, 2025',
              time: '${10 + index}:30 AM',
              amount: '\$19.99',
              plan: 'Premium Plan',
              method: index % 2 == 0 ? 'Credit Card' : 'PayPal',
              status: isSuccess ? 'Success' : 'Failed',
              isSuccess: isSuccess,
            );
          },
        ),
      ),
    );
  }

  Widget _buildPaymentCard({
    required String transactionId,
    required String date,
    required String time,
    required String amount,
    required String plan,
    required String method,
    required String status,
    required bool isSuccess,
  }) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: transactionId,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.secondaryText,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: isSuccess
                      ? AppColors.success.withOpacity(0.1)
                      : AppColors.error.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: CommonText(
                  text: status,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isSuccess ? AppColors.success : AppColors.error,
                ),
              ),
            ],
          ),
          12.height,
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.receipt,
                  color: AppColors.primary,
                  size: 24.sp,
                ),
              ),
              16.width,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: plan,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    4.height,
                    CommonText(
                      text: method,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.secondaryText,
                    ),
                  ],
                ),
              ),
              CommonText(
                text: amount,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ],
          ),
          12.height,
          Divider(color: AppColors.border),
          12.height,
          Row(
            children: [
              Icon(
                Icons.calendar_today,
                size: 14.sp,
                color: AppColors.secondaryText,
              ),
              6.width,
              CommonText(
                text: date,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.secondaryText,
              ),
              16.width,
              Icon(
                Icons.access_time,
                size: 14.sp,
                color: AppColors.secondaryText,
              ),
              6.width,
              CommonText(
                text: time,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.secondaryText,
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  // Download invoice
                },
                child: Row(
                  children: [
                    Icon(Icons.download, size: 16.sp),
                    4.width,
                    const CommonText(
                      text: 'Invoice',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
