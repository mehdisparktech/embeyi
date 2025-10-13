import 'package:embeyi/core/component/image/common_image.dart';
import 'package:embeyi/core/utils/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../config/route/job_seeker_routes.dart';
import '../../config/route/recruiter_routes.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/log/app_log.dart';

class CommonBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final bool isJobSeeker;

  const CommonBottomNavBar({
    required this.currentIndex,
    this.isJobSeeker = true,
    super.key,
  });

  @override
  State<CommonBottomNavBar> createState() => _CommonBottomNavBarState();
}

class _CommonBottomNavBarState extends State<CommonBottomNavBar> {
  var bottomNavIndex = 0;
  List<Widget> unselectedIcons = [
    CommonImage(imageSrc: AppIcons.home, size: 30.sp),
    CommonImage(imageSrc: AppIcons.work, size: 30.sp),
    CommonImage(imageSrc: AppIcons.history, size: 30.sp),
    CommonImage(imageSrc: AppIcons.person, size: 30.sp),
  ];

  List<Widget> selectedIcons = [
    CommonImage(imageSrc: AppIcons.home2, size: 30.sp),
    CommonImage(imageSrc: AppIcons.work2, size: 30.sp),
    CommonImage(imageSrc: AppIcons.history2, size: 30.sp),
    CommonImage(imageSrc: AppIcons.person2, size: 30.sp),
  ];

  @override
  void initState() {
    bottomNavIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        padding: EdgeInsets.all(12.sp),
        decoration: BoxDecoration(color: AppColors.buttomNavBarColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(unselectedIcons.length, (index) {
            return GestureDetector(
              onTap: () => onTap(index),
              child: Container(
                margin: EdgeInsetsDirectional.all(12.sp),
                child: Column(
                  children: [
                    index == bottomNavIndex
                        ? selectedIcons[index]
                        : unselectedIcons[index],
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  void onTap(int index) async {
    appLog(widget.currentIndex, source: "common bottombar");

    if (widget.isJobSeeker) {
      // Job Seeker Navigation
      if (index == 0) {
        if (!(widget.currentIndex == 0)) {
          Get.toNamed(JobSeekerRoutes.home);
        }
      } else if (index == 1) {
        if (!(widget.currentIndex == 1)) {
          Get.toNamed(JobSeekerRoutes.jobs);
        }
      } else if (index == 2) {
        if (!(widget.currentIndex == 2)) {
          Get.toNamed(JobSeekerRoutes.history);
        }
      } else if (index == 3) {
        if (!(widget.currentIndex == 3)) {
          Get.toNamed(JobSeekerRoutes.profile);
        }
      }
    } else {
      // Recruiter Navigation
      if (index == 0) {
        if (!(widget.currentIndex == 0)) {
          Get.toNamed(RecruiterRoutes.setting);
        }
      } else if (index == 1) {
        if (!(widget.currentIndex == 1)) {
          Get.toNamed(RecruiterRoutes.notifications);
        }
      } else if (index == 2) {
        if (!(widget.currentIndex == 2)) {
          Get.toNamed(RecruiterRoutes.chat);
        }
      } else if (index == 3) {
        if (!(widget.currentIndex == 3)) {
          Get.toNamed(RecruiterRoutes.profile);
        }
      }
    }
  }
}
