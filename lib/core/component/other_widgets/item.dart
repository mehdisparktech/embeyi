import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constants/app_colors.dart';
import '../image/common_image.dart';
import '../text/common_text.dart';

class Item extends StatelessWidget {
  const Item({
    super.key,
    this.imageSrc,
    required this.title,
    this.image = "",
    this.disableDivider = false,
    this.onTap,
    this.color = AppColors.black,
    this.vertical = 4,
    this.horizontal = 24,
    this.disableIcon = false,
  });

  final String? imageSrc;
  final String title;
  final String image;
  final bool disableDivider;
  final bool disableIcon;
  final VoidCallback? onTap;
  final Color color;
  final double vertical;
  final double horizontal;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.sp),
        margin: EdgeInsets.only(bottom: 15.h),
        decoration: ShapeDecoration(
          color: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
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
        child: Column(
          children: [
            Row(
              children: [
                imageSrc != null
                    ? CommonImage(imageSrc: imageSrc!, width: 20, height: 20)
                    : CommonImage(imageSrc: image),
                CommonText(
                  text: title,
                  color: color,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  left: 16,
                ),
                const Spacer(),
                disableIcon
                    ? const SizedBox()
                    : Icon(Icons.arrow_forward_ios_outlined, size: 20.sp),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
