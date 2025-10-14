import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/component/text/common_text.dart';
import '../../../../../../core/component/text_field/common_text_field.dart';
import '../../../../../../core/utils/extensions/extension.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  final TextEditingController projectNameController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController projectUrlController = TextEditingController();
  final TextEditingController technologiesController = TextEditingController();
  bool isOngoing = false;

  @override
  void dispose() {
    projectNameController.dispose();
    roleController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    descriptionController.dispose();
    projectUrlController.dispose();
    technologiesController.dispose();
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
          text: 'Project',
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
                      _buildLabel('Project Name'),
                      8.height,
                      CommonTextField(
                        controller: projectNameController,
                        hintText: 'e.g. E-commerce Mobile App',
                      ),
                      16.height,

                      _buildLabel('Your Role'),
                      8.height,
                      CommonTextField(
                        controller: roleController,
                        hintText: 'e.g. Lead Designer',
                      ),
                      16.height,

                      _buildLabel('Project URL (Optional)'),
                      8.height,
                      CommonTextField(
                        controller: projectUrlController,
                        hintText: 'https://example.com',
                        keyboardType: TextInputType.url,
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
                            firstDate: DateTime(2000),
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
                            value: isOngoing,
                            onChanged: (value) {
                              setState(() {
                                isOngoing = value ?? false;
                                if (isOngoing) {
                                  endDateController.text = 'Ongoing';
                                } else {
                                  endDateController.clear();
                                }
                              });
                            },
                            activeColor: AppColors.primary,
                          ),
                          const CommonText(
                            text: 'This project is ongoing',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      16.height,

                      if (!isOngoing) ...[
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
                              firstDate: DateTime(2000),
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

                      _buildLabel('Technologies Used'),
                      8.height,
                      CommonTextField(
                        controller: technologiesController,
                        hintText: 'e.g. Flutter, Firebase, REST API',
                      ),
                      16.height,

                      _buildLabel('Description'),
                      8.height,
                      CommonTextField(
                        controller: descriptionController,
                        hintText: 'Describe the project and your contributions',
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
