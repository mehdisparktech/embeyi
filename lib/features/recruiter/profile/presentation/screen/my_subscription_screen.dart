import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/component/text/common_text.dart';
import '../../../../../core/utils/extensions/extension.dart';

class MySubscriptionScreen extends StatelessWidget {
  const MySubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      32.height,

                      // Profile Section
                      _buildProfileSection(),

                      40.height,

                      // Subscription Details Table
                      _buildSubscriptionTable(),

                      40.height,

                      // Renew Button
                      _buildRenewButton(),

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
                text: 'My Subscription',
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

  Widget _buildProfileSection() {
    return Column(
      children: [
        // Profile Image
        Container(
          width: 100.w,
          height: 100.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF1E3A5F),
            border: Border.all(color: Colors.grey.shade200, width: 2),
            image: const DecorationImage(
              image: AssetImage('assets/images/profile.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),

        16.height,

        // Name
        const CommonText(
          text: 'Shakir Ahmed',
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),

        6.height,

        // Role
        CommonText(
          text: 'UX Designer',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.grey.shade600,
        ),

        12.height,

        // Premium Badge
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF4E6),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.workspace_premium,
                color: const Color(0xFFFF9800),
                size: 18.sp,
              ),
              6.width,
              const CommonText(
                text: 'Premium Plan',
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFFFF9800),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSubscriptionTable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade200, width: 1),
      ),
      child: Column(
        children: [
          _buildTableRow('Pack Nam', 'Premium Plan', isFirst: true),
          _buildDivider(),
          _buildTableRow('Price', '\$19.99'),
          _buildDivider(),
          _buildTableRow('Start Date', '01 January 2025'),
          _buildDivider(),
          _buildTableRow('End Date', '31 January 2025'),
          _buildDivider(),
          _buildTableRow('Remaining Days', '25 Days', isLast: true),
        ],
      ),
    );
  }

  Widget _buildTableRow(
    String label,
    String value, {
    bool isFirst = false,
    bool isLast = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonText(
            text: label,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
          CommonText(
            text: value,
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      color: Colors.grey.shade200,
    );
  }

  Widget _buildRenewButton() {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: () {
          // Handle renew action
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3B4DE3),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          shadowColor: const Color(0xFF3B4DE3).withOpacity(0.3),
        ),
        child: const CommonText(
          text: 'Renew Pack',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
