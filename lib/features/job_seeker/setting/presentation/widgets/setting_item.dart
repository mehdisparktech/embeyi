import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/component/text/common_text.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({super.key, required this.title, required this.iconDate});

  final String title;
  final IconData iconDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
        color: AppColors.white,
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          /// show icon here
          Icon(iconDate, color: AppColors.black),

          /// show Title here
          CommonText(text: title, color: AppColors.black, left: 12),
          const Spacer(),

          /// show Icon here
          const Icon(Icons.arrow_forward_ios, color: AppColors.black),
        ],
      ),
    );
  }
}
