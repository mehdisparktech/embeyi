import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final List<Widget> actions;
  final Color backgroundColor;
  final Color textColor;
  final bool centerTitle;
  final bool showBackButton;
  final bool showLeading;
  final bool showActions;
  final bool showTitle;
  final bool showBottom;
  final PreferredSizeWidget? bottom;
  final bool showElevation;
  final double elevation;
  final bool showLeadingIcon;
  final Widget? leadingIcon;
  @override
  final Size preferredSize;

  CommonAppbar({
    super.key,
    this.title,
    this.leading = const BackButton(color: AppColors.black),
    this.actions = const <Widget>[],
    this.backgroundColor = AppColors.white,
    this.textColor = AppColors.black,
    this.centerTitle = true,
    this.showBackButton = true,
    this.showLeading = true,
    this.showActions = true,
    this.showTitle = true,
    this.showBottom = false,
    this.bottom,
    this.showElevation = true,
    this.elevation = 0,
    this.showLeadingIcon = true,
    this.leadingIcon = const Icon(Icons.menu),
  }) : preferredSize = Size.fromHeight(
         kToolbarHeight + (bottom?.preferredSize.height ?? 0),
       );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showLeading
          ? leading
          : showLeadingIcon
          ? leadingIcon
          : null,
      title: showTitle ? Text(title ?? '') : null,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      actions: showActions ? actions : null,
      bottom: showBottom ? bottom : null,
      elevation: showElevation ? elevation : 0,
      automaticallyImplyLeading: showBackButton,
      iconTheme: IconThemeData(color: textColor),
      titleTextStyle: TextStyle(
        color: textColor,
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
