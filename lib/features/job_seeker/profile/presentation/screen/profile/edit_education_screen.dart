import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/component/text/common_text.dart';
import '../../../../../../core/component/text_field/common_text_field.dart';
import '../../../../../../core/component/button/common_button.dart';

class EditEducationScreen extends StatefulWidget {
  const EditEducationScreen({super.key});

  @override
  State<EditEducationScreen> createState() => _EditEducationScreenState();
}

class _EditEducationScreenState extends State<EditEducationScreen> {
  final TextEditingController degreeController = TextEditingController(
    text: 'Computer Science',
  );
  final TextEditingController instituteController = TextEditingController(
    text: 'Oxford University',
  );
  final TextEditingController startDateController = TextEditingController(
    text: '01 Jan 2020',
  );
  final TextEditingController endDateController = TextEditingController(
    text: '01 Jan 2020',
  );
  final TextEditingController passingYearController = TextEditingController(
    text: '2026',
  );
  final TextEditingController gpaController = TextEditingController(
    text: '5.00',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.black, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: CommonText(
          text: 'Edit Education',
          fontWeight: FontWeight.w600,
          fontSize: 18.sp,
          color: AppColors.black,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),

                    // Degree Field
                    _buildLabel('Degree'),
                    SizedBox(height: 8.h),
                    CommonTextField(
                      controller: degreeController,
                      hintText: 'Enter degree',
                    ),
                    SizedBox(height: 16.h),

                    // Institute Field
                    _buildLabel('Institute'),
                    SizedBox(height: 8.h),
                    CommonTextField(
                      controller: instituteController,
                      hintText: 'Enter institute name',
                    ),
                    SizedBox(height: 16.h),

                    // Start Date Field
                    _buildLabel('Start Date'),
                    SizedBox(height: 8.h),
                    CommonTextField(
                      controller: startDateController,
                      hintText: 'Select start date',
                      readOnly: true,
                      suffixIcon: Icon(
                        Icons.calendar_today,
                        size: 20.sp,
                        color: AppColors.primaryColor,
                      ),
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime.now(),
                        );
                        if (date != null) {
                          startDateController.text =
                              '${date.day.toString().padLeft(2, '0')} ${_getMonthName(date.month)} ${date.year}';
                        }
                      },
                    ),
                    SizedBox(height: 16.h),

                    // End Date Field
                    _buildLabel('End Date'),
                    SizedBox(height: 8.h),
                    CommonTextField(
                      controller: endDateController,
                      hintText: 'Select end date',
                      readOnly: true,
                      suffixIcon: Icon(
                        Icons.calendar_today,
                        size: 20.sp,
                        color: AppColors.primaryColor,
                      ),
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime.now(),
                        );
                        if (date != null) {
                          endDateController.text =
                              '${date.day.toString().padLeft(2, '0')} ${_getMonthName(date.month)} ${date.year}';
                        }
                      },
                    ),
                    SizedBox(height: 16.h),

                    // Passing Year Field
                    _buildLabel('Passing Year'),
                    SizedBox(height: 8.h),
                    CommonTextField(
                      controller: passingYearController,
                      hintText: 'Enter passing year',
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 16.h),

                    // GPA Field
                    _buildLabel('Grade Point'),
                    SizedBox(height: 8.h),
                    CommonTextField(
                      controller: gpaController,
                      hintText: 'Enter GPA',
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),

            // Update Button
            Padding(
              padding: EdgeInsets.all(20.w),
              child: CommonButton(
                titleText: 'Update',
                buttonHeight: 50.h,
                titleSize: 16.sp,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return CommonText(
      text: text,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    );
  }

  String _getMonthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month - 1];
  }

  @override
  void dispose() {
    degreeController.dispose();
    instituteController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    passingYearController.dispose();
    gpaController.dispose();
    super.dispose();
  }
}
