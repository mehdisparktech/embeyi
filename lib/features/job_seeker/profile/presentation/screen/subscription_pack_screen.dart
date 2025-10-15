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
  int _selectedTabIndex = 1; // Default to Standard
  final PageController _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.85,
  );

  final List<Map<String, dynamic>> _subscriptionPlans = [
    {
      'title': 'Freelance',
      'price': '\$0',
      'subtitle': 'From Plan (Starter)',
      'features': [
        'Browse Job listings',
        'Limited Apply (5-10)',
        'Basic Resume Templates',
        'Email Job Alerts',
        'No Ads Remove',
      ],
      'buttonText': 'Enable',
      'isPrimary': false,
    },
    {
      'title': 'Standard',
      'price': '\$19.99',
      'subtitle': '/month',
      'features': [
        'Unlimited Auto-Apply',
        'Ai-powered Job Matching',
        'ATS Analysis & Customization Tips',
        'Priority Job Listings & Faster Replies',
        'No Unseen Copies Or Advanced Analytics',
      ],
      'buttonText': 'Buy Now',
      'isPrimary': true,
    },
    {
      'title': 'Premium',
      'price': '\$69.99',
      'subtitle': '/month',
      'features': [
        'Everything in Premium',
        'Custom Outreach Personalized',
        'Creator Outreach (Bulk Rep Applying others)',
        'API Access',
        'Advanced Analytics & Insights',
        'Behavioral Performance Interview',
        'Simulation Priority Access to',
        'New Features',
      ],
      'buttonText': 'Buy Now',
      'isPrimary': true,
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            _buildHeader(),

            // Tab Section
            _buildTabBar(),

            32.height,

            // Subscription Cards
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _selectedTabIndex = index;
                  });
                },
                itemCount: _subscriptionPlans.length,
                itemBuilder: (context, index) {
                  return _buildSubscriptionCard(
                    _subscriptionPlans[index],
                    index == _selectedTabIndex,
                  );
                },
              ),
            ),

            40.height,
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
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

  Widget _buildTabBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: EdgeInsets.all(4.w),
        child: Row(
          children: List.generate(_subscriptionPlans.length, (index) {
            final isSelected = _selectedTabIndex == index;
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedTabIndex = index;
                  });
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFF4A5FFF)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Center(
                    child: CommonText(
                      text: _subscriptionPlans[index]['title'],
                      fontSize: 14,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w500,
                      color: isSelected ? Colors.white : Colors.black54,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildSubscriptionCard(Map<String, dynamic> plan, bool isActive) {
    final isPrimary = plan['isPrimary'] as bool;
    final isFree = plan['price'] == '\$0';

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Container(
        margin: EdgeInsets.only(bottom: 20.h),
        decoration: BoxDecoration(
          gradient: isPrimary && isActive
              ? const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF4A5FFF), Color(0xFF6B7FFF)],
                )
              : null,
          color: isPrimary && isActive ? null : Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isPrimary && isActive
                ? Colors.transparent
                : Colors.grey.shade200,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: isPrimary && isActive
                  ? const Color(0xFF4A5FFF).withOpacity(0.3)
                  : Colors.black.withOpacity(0.08),
              blurRadius: isPrimary && isActive ? 20 : 10,
              offset: Offset(0, isPrimary && isActive ? 10 : 4),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Price Section
              _buildPriceSection(
                plan['price'],
                plan['subtitle'],
                isPrimary && isActive,
                isFree,
              ),

              24.height,

              // Features List
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: List.generate(
                      (plan['features'] as List<String>).length,
                      (index) => _buildFeatureItem(
                        plan['features'][index],
                        isPrimary && isActive,
                      ),
                    ),
                  ),
                ),
              ),

              24.height,

              // Action Button
              _buildActionButton(
                plan['buttonText'],
                isPrimary && isActive,
                isFree,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPriceSection(
    String price,
    String subtitle,
    bool isActive,
    bool isFree,
  ) {
    final textColor = isActive ? Colors.white : Colors.black87;
    final subtitleColor = isActive ? Colors.white70 : Colors.black54;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: price,
                style: TextStyle(
                  fontSize: isFree ? 32.sp : 40.sp,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                  height: 1.2,
                ),
              ),
              TextSpan(
                text: subtitle,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: subtitleColor,
                ),
              ),
            ],
          ),
        ),
        if (isFree) ...[
          4.height,
          CommonText(
            text: '(Starter)',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: subtitleColor,
          ),
        ],
      ],
    );
  }

  Widget _buildFeatureItem(String feature, bool isActive) {
    final textColor = isActive ? Colors.white : Colors.black87;
    final iconColor = isActive ? Colors.white : const Color(0xFF4A5FFF);

    return Padding(
      padding: EdgeInsets.only(bottom: 14.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check, color: iconColor, size: 20.sp),
          12.width,
          Expanded(
            child: CommonText(
              text: feature,
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: textColor,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String text, bool isActive, bool isFree) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
        onPressed: () {
          // Handle button action
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive
              ? Colors.white
              : (isFree ? Colors.white : const Color(0xFF4A5FFF)),
          foregroundColor: isActive
              ? const Color(0xFF4A5FFF)
              : (isFree ? const Color(0xFF4A5FFF) : Colors.white),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
            side: isFree && !isActive
                ? BorderSide(color: const Color(0xFF4A5FFF), width: 1.5)
                : BorderSide.none,
          ),
        ),
        child: CommonText(
          text: text,
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: isActive
              ? const Color(0xFF4A5FFF)
              : (isFree ? const Color(0xFF4A5FFF) : Colors.white),
        ),
      ),
    );
  }
}
