import 'package:flutter/material.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/component/text/common_text.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    required this.title,
    required this.iconDate,
    required this.onTap,
  });

  final String title;
  final IconData iconDate;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: ShapeDecoration(
          color: AppColors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: const Color(0xFFEDEDED)),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 4,
              offset: Offset(0, 1),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          children: [
            /// show icon here
            Icon(iconDate, color: AppColors.black, size: 24),

            /// show Title here
            CommonText(
              text: title,
              color: AppColors.black,
              left: 12,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            const Spacer(),

            /// show Icon here
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.black,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
