import 'package:embeyi/core/config/route/job_seeker_routes.dart';
import 'package:embeyi/features/job_seeker/home/presentation/widgets/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllJobCategoryScreen extends StatelessWidget {
  const AllJobCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Job Category')),
      body: GridView.builder(
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
            icon: index % 2 == 0
                ? Icons.school_outlined
                : index % 3 == 0
                ? Icons.bar_chart_outlined
                : Icons.account_balance_outlined,
            title: index % 2 == 0
                ? 'Education'
                : index % 3 == 0
                ? 'Marketing'
                : 'Accounting',
            onTap: () {
              // Handle category tap
              JobSeekerRoutes.goToCategoryJobList(
                index % 2 == 0
                    ? 'Education'
                    : index % 3 == 0
                    ? 'Marketing'
                    : 'Accounting',
              );
            },
            jobCount: index * 10 + 5,
            isJobCountVisible: true,
          );
        },
      ),
    );
  }
}
