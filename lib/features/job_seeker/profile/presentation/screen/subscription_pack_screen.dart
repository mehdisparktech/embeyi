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
  int _selectedTabIndex = 0; // Default to Standard
  final PageController _pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.88,
  );

  final List<Map<String, dynamic>> _subscriptionPlans = [
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
      'title': 'Freelance',
      'price': '\$0/',
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
    final isFree = plan['price'].toString().startsWith('\$0');

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
                : const Color(0xFFE5E7EB),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: isPrimary && isActive
                  ? const Color(0xFF4A5FFF).withOpacity(0.25)
                  : Colors.black.withOpacity(0.06),
              blurRadius: isPrimary && isActive ? 24 : 12,
              offset: Offset(0, isPrimary && isActive ? 12 : 4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 28.h),
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

              28.height,

              // Features List
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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

              28.height,

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
        if (isFree) ...[
          // For free plan, show price and subtitle separately
          CommonText(
            text: price,
            fontSize: 36.sp,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
          4.height,
          CommonText(
            text: subtitle,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: subtitleColor,
          ),
        ] else ...[
          // For paid plans, show price and /month inline
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: price,
                  style: TextStyle(
                    fontSize: 40.sp,
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
        ],
      ],
    );
  }

  Widget _buildFeatureItem(String feature, bool isActive) {
    final textColor = isActive ? Colors.white : const Color(0xFF374151);
    final iconColor = isActive ? Colors.white : const Color(0xFF4A5FFF);

    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, color: iconColor, size: 20.sp),
          12.width,
          Expanded(
            child: CommonText(
              text: feature,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: textColor,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String text, bool isActive, bool isFree) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
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
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
            side: (isFree && !isActive) || (isActive && !isFree)
                ? const BorderSide(color: Color(0xFF4A5FFF), width: 1.5)
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
