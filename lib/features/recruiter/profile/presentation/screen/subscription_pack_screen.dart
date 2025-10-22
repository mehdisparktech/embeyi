import 'package:embeyi/core/component/button/common_button.dart';
import 'package:embeyi/core/component/image/common_image.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/component/text/common_text.dart';
import '../../../../../core/utils/extensions/extension.dart';

class SubscriptionPackScreen extends StatefulWidget {
  const SubscriptionPackScreen({super.key});

  @override
  State<SubscriptionPackScreen> createState() => _SubscriptionPackScreenState();
}

class _SubscriptionPackScreenState extends State<SubscriptionPackScreen> {
  String selectedPlan = 'free';

  final Map<String, Map<String, dynamic>> plans = {
    'free': {
      'name': 'Free Plan',
      'subtitle': 'Free Plan (Starter)',
      'price': '\$0',
      'isFree': true,
      'features': [
        'Browse Job Listings',
        'Unlimited Auto-Apply (+50)',
        'Basic Resume Templates',
        'No AI Cover Letters',
        'No ATS Score/Analysis',
      ],
    },
    'premium': {
      'name': 'Premium Plan',
      'subtitle': 'monthly',
      'price': '\$19.99',
      'isFree': false,
      'features': [
        'Browse Job Listings',
        'Unlimited Auto-Apply (+100)',
        'Advanced Resume Templates',
        'AI Cover Letters',
        'ATS Score/Analysis',
      ],
    },
    'pro': {
      'name': 'Pro Plan',
      'subtitle': 'yearly',
      'price': '\$49.99',
      'isFree': false,
      'features': [
        'Browse Job Listings',
        'Unlimited Auto-Apply (Unlimited)',
        'Premium Resume Templates',
        'Priority AI Cover Letters',
        'Advanced ATS Score/Analysis',
      ],
    },
  };

  @override
  Widget build(BuildContext context) {
    final planData = plans[selectedPlan]!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(context),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      24.height,

                      // Package Tabs
                      _buildPackageTabs(),

                      60.height,

                      // Plan Card
                      _buildPlanCard(planData),

                      40.height,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
              size: 20.sp,
              color: Colors.black87,
            ),
          ),
          Expanded(
            child: Center(
              child: CommonText(
                text: 'Package',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(width: 20.w),
        ],
      ),
    );
  }

  Widget _buildPackageTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildTabButton('Free Plan', 'free'),
        _buildTabButton('Premium Plan', 'premium'),
        _buildTabButton('Pro Plan', 'pro'),
      ],
    );
  }

  Widget _buildTabButton(String label, String value) {
    final isSelected = selectedPlan == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPlan = value;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
        decoration: ShapeDecoration(
          gradient: isSelected
              ? LinearGradient(
                  begin: Alignment(0.00, 0.50),
                  end: Alignment(1.00, 0.50),
                  colors: [const Color(0xFF123499), const Color(0xFF2956DD)],
                )
              : null,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: CommonText(
          text: label,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: isSelected ? Colors.white : AppColors.primary,
        ),
      ),
    );
  }

  Widget _buildPlanCard(Map<String, dynamic> planData) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: const Color(0xFF123499)),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Price and Title
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(30.w),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: const Color(0xFF123499)),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  gradient: LinearGradient(
                    colors: [AppColors.gradientColor, AppColors.gradientColor2],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CommonText(
                      text: planData['price'],
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    CommonText(
                      text: '/',
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    8.width,
                    CommonText(
                      text: planData['subtitle'],
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white70,
                      top: 20,
                    ),
                  ],
                ),
              ),

              28.height,

              // Features List
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: List.generate(
                    planData['features'].length,
                    (index) => Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonImage(
                            imageSrc: AppIcons.check2,
                            width: 20.w,
                            height: 20.h,
                          ),
                          10.width,
                          CommonText(
                            text: planData['features'][index],
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              _buildEnableButton(planData),
            ],
          ),
        ),
        Positioned(
          top: -30.w,
          right: 160.w,
          child: Container(
            width: 59,
            height: 59,
            padding: const EdgeInsets.symmetric(
              horizontal: 11.80,
              vertical: 10.62,
            ),
            decoration: ShapeDecoration(
              color: Colors.white /* White-BG */,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1.18, color: const Color(0xFFF48201)),
                borderRadius: BorderRadius.circular(29.50),
              ),
            ),
            child: CommonImage(
              imageSrc: planData['isFree'] ? AppIcons.free : AppIcons.premium,
              width: 24.w,
              height: 24.h,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEnableButton(Map<String, dynamic> planData) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF6FB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: CommonButton(
        titleText: planData['isFree'] ? "Enable" : "Buy Now",
        onTap: () {},
        isGradient: planData['isFree'] ? true : false,
        buttonColor: planData['isFree']
            ? AppColors.transparent
            : AppColors.primary,
        titleColor: planData['isFree'] ? AppColors.primary : AppColors.white,
      ),
    );
  }
}
