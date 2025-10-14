import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/component/text/common_text.dart';
import '../../../../../core/component/button/common_button.dart';
import '../../../../../core/utils/extensions/extension.dart';

class PlatformReviewScreen extends StatefulWidget {
  const PlatformReviewScreen({super.key});

  @override
  State<PlatformReviewScreen> createState() => _PlatformReviewScreenState();
}

class _PlatformReviewScreenState extends State<PlatformReviewScreen> {
  int selectedRating = 0;
  final TextEditingController reviewController = TextEditingController();

  @override
  void dispose() {
    reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CommonText(
          text: 'Platform Review',
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
                /// Review Header
                Center(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20.w),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.star_border,
                          size: 64.sp,
                          color: AppColors.primary,
                        ),
                      ),
                      16.height,
                      const CommonText(
                        text: 'Rate Your Experience',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      8.height,
                      CommonText(
                        text: 'Help us improve by sharing your feedback',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondaryText,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                32.height,

                /// Rating Section
                const CommonText(
                  text: 'How would you rate us?',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                16.height,
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedRating = index + 1;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Icon(
                            index < selectedRating
                                ? Icons.star
                                : Icons.star_border,
                            size: 48.sp,
                            color: index < selectedRating
                                ? AppColors.warning
                                : AppColors.secondaryText,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                if (selectedRating > 0) ...[
                  8.height,
                  Center(
                    child: CommonText(
                      text: _getRatingText(selectedRating),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                  ),
                ],
                32.height,

                /// Review Text Area
                const CommonText(
                  text: 'Share your thoughts',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                16.height,
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: TextField(
                    controller: reviewController,
                    maxLines: 6,
                    decoration: InputDecoration(
                      hintText: 'Write your review here...',
                      hintStyle: TextStyle(
                        color: AppColors.secondaryText,
                        fontSize: 14.sp,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16.w),
                    ),
                  ),
                ),
                32.height,

                /// Submit Button
                CommonButton(
                  titleText: 'Submit Review',
                  onTap: selectedRating > 0 && reviewController.text.isNotEmpty
                      ? () {
                          // Submit review
                          _showThankYouDialog(context);
                        }
                      : null,
                  buttonColor:
                      selectedRating > 0 && reviewController.text.isNotEmpty
                      ? AppColors.primary
                      : AppColors.secondaryText,
                ),
                24.height,

                /// Previous Reviews Section
                const CommonText(
                  text: 'Your Previous Reviews',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                16.height,
                _buildPreviousReviewCard(
                  rating: 5,
                  date: 'December 15, 2024',
                  review:
                      'Excellent platform! Found my dream job within 2 weeks. Highly recommended!',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getRatingText(int rating) {
    switch (rating) {
      case 1:
        return 'Poor';
      case 2:
        return 'Fair';
      case 3:
        return 'Good';
      case 4:
        return 'Very Good';
      case 5:
        return 'Excellent';
      default:
        return '';
    }
  }

  Widget _buildPreviousReviewCard({
    required int rating,
    required String date,
    required String review,
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
            children: [
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    index < rating ? Icons.star : Icons.star_border,
                    size: 18.sp,
                    color: index < rating
                        ? AppColors.warning
                        : AppColors.secondaryText,
                  ),
                ),
              ),
              const Spacer(),
              CommonText(
                text: date,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.secondaryText,
              ),
            ],
          ),
          12.height,
          CommonText(
            text: review,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            maxLines: 5,
          ),
        ],
      ),
    );
  }

  void _showThankYouDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle, color: AppColors.success, size: 64.sp),
            16.height,
            const CommonText(
              text: 'Thank You!',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            8.height,
            CommonText(
              text: 'Your review has been submitted successfully',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.secondaryText,
              textAlign: TextAlign.center,
            ),
            24.height,
            CommonButton(
              titleText: 'Done',
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
