import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/component/text/common_text.dart';
import '../../../../../../core/component/text_field/common_text_field.dart';
import '../../../../../../core/utils/extensions/extension.dart';

class WorkExperienceScreen extends StatefulWidget {
  const WorkExperienceScreen({super.key});

  @override
  State<WorkExperienceScreen> createState() => _WorkExperienceScreenState();
}

class _WorkExperienceScreenState extends State<WorkExperienceScreen> {
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  bool isCurrentlyWorking = false;

  @override
  void dispose() {
    jobTitleController.dispose();
    companyController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const CommonText(
          text: 'Work Experience',
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('Job Title'),
                      8.height,
                      CommonTextField(
                        controller: jobTitleController,
                        hintText: 'e.g. UI/UX Designer',
                      ),
                      16.height,

                      _buildLabel('Company'),
                      8.height,
                      CommonTextField(
                        controller: companyController,
                        hintText: 'e.g. Google Inc.',
                      ),
                      16.height,

                      _buildLabel('Start Date'),
                      8.height,
                      CommonTextField(
                        controller: startDateController,
                        hintText: 'Select start date',
                        readOnly: true,
                        suffixIcon: Icon(
                          Icons.calendar_today,
                          size: 20.sp,
                          color: AppColors.primary,
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
                                '${date.month}/${date.year}';
                          }
                        },
                      ),
                      16.height,

                      Row(
                        children: [
                          Checkbox(
                            value: isCurrentlyWorking,
                            onChanged: (value) {
                              setState(() {
                                isCurrentlyWorking = value ?? false;
                                if (isCurrentlyWorking) {
                                  endDateController.text = 'Present';
                                } else {
                                  endDateController.clear();
                                }
                              });
                            },
                            activeColor: AppColors.primary,
                          ),
                          const CommonText(
                            text: 'I am currently working in this role',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      16.height,

                      if (!isCurrentlyWorking) ...[
                        _buildLabel('End Date'),
                        8.height,
                        CommonTextField(
                          controller: endDateController,
                          hintText: 'Select end date',
                          readOnly: true,
                          suffixIcon: Icon(
                            Icons.calendar_today,
                            size: 20.sp,
                            color: AppColors.primary,
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
                                  '${date.month}/${date.year}';
                            }
                          },
                        ),
                        16.height,
                      ],

                      _buildLabel('Description'),
                      8.height,
                      CommonTextField(
                        controller: descriptionController,
                        hintText:
                            'Describe your responsibilities and achievements',
                        maxLines: 5,
                        textInputAction: TextInputAction.newline,
                      ),
                      24.height,
                    ],
                  ),
                ),
              ),
            ),

            /// Save Button
            Padding(
              padding: EdgeInsets.all(16.w),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle save
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: const CommonText(
                    text: 'Save',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
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
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
  }
}
