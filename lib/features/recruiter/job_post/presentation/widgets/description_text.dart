// Description Text Widget
import 'package:embeyi/core/component/text/common_text.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  final String text;

  const DescriptionText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return CommonText(
      text: text,
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: AppColors.primaryText,
      textAlign: TextAlign.justify,
      maxLines: 100,
    );
  }
}
