import 'package:embeyi/core/component/text_field/common_text_field.dart';
import 'package:embeyi/core/config/route/job_seeker_routes.dart';
import 'package:embeyi/core/utils/constants/app_icons.dart';
import 'package:embeyi/core/utils/extensions/extension.dart';
import 'package:embeyi/features/job_seeker/home/presentation/widgets/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllJobCategoryScreen extends StatelessWidget {
  const AllJobCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Category')),
      body: Column(
        children: [
          20.height,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CommonTextField(
              controller: TextEditingController(),
              hintText: 'Search by category',
              //prefixIcon: CommonImage(imageSrc: AppIcons.edit, size: 16.sp),
            ),
          ),
          20.height,
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                childAspectRatio: 1,
              ),
              itemCount: 8,
              itemBuilder: (context, index) {
                return JobCategoryCard(
                  imageSrc: index % 2 == 0
                      ? AppIcons.education
                      : index % 3 == 0
                      ? AppIcons.marketing
                      : AppIcons.restaurant,
                  title: index % 2 == 0
                      ? 'Education'
                      : index % 3 == 0
                      ? 'Marketing'
                      : 'Restaurant',
                  onTap: () {
                    // Handle category tap
                    JobSeekerRoutes.goToCategoryJobList(
                      index % 2 == 0
                          ? 'Education'
                          : index % 3 == 0
                          ? 'Marketing'
                          : 'Restaurant',
                    );
                  },
                  jobCount: index * 10 + 5,
                  isJobCountVisible: true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
