import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constants/app_colors.dart';
import '../button/common_button.dart';
import '../text/common_text.dart';
import '../text_field/common_text_field.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  // Controllers
  final TextEditingController minSalaryController = TextEditingController(
    text: '\$5000',
  );
  final TextEditingController maxSalaryController = TextEditingController(
    text: '\$8000',
  );

  // State variables
  String? selectedCategory = 'Sr. UI/UX Designer';
  String selectedEmployeeType = 'Full Time';
  String selectedJobType = 'Remote';
  double distanceValue = 20.0;

  @override
  void dispose() {
    minSalaryController.dispose();
    maxSalaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          _buildHeader(context),

          // Content
          Flexible(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),

                  // Category Section
                  _buildCategorySection(),

                  SizedBox(height: 20.h),

                  // Employee Type Section
                  _buildEmployeeTypeSection(),

                  SizedBox(height: 20.h),

                  // Job Type Section
                  _buildJobTypeSection(),

                  SizedBox(height: 20.h),

                  // Salary Range Section
                  _buildSalaryRangeSection(),

                  SizedBox(height: 20.h),

                  // Distance Section
                  _buildDistanceSection(),

                  SizedBox(height: 24.h),

                  // Apply Button
                  _buildApplyButton(),

                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Header with title and close button
  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.borderColor.withOpacity(0.3),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 24.w),
          CommonText(
            text: 'Filter',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.close, size: 24.sp, color: AppColors.black),
          ),
        ],
      ),
    );
  }

  // Category Dropdown Section
  Widget _buildCategorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: 'Category',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(4.r),
            border: Border.all(color: AppColors.borderColor, width: 1),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedCategory,
              isExpanded: true,
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.black,
                size: 24.sp,
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.primaryText,
              ),
              items:
                  [
                    'Sr. UI/UX Designer',
                    'Jr. UI/UX Designer',
                    'Product Designer',
                    'Graphic Designer',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  // Employee Type Chips Section
  Widget _buildEmployeeTypeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: 'Employee Type',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Expanded(
              child: _buildChip(
                label: 'Full Time',
                isSelected: selectedEmployeeType == 'Full Time',
                selectedColor: AppColors.secondaryPrimary,
                onTap: () {
                  setState(() {
                    selectedEmployeeType = 'Full Time';
                  });
                },
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: _buildChip(
                label: 'Part Time',
                isSelected: selectedEmployeeType == 'Part Time',
                selectedColor: AppColors.secondaryPrimary,
                onTap: () {
                  setState(() {
                    selectedEmployeeType = 'Part Time';
                  });
                },
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: _buildChip(
                label: 'Intern',
                isSelected: selectedEmployeeType == 'Intern',
                selectedColor: AppColors.secondaryPrimary,
                onTap: () {
                  setState(() {
                    selectedEmployeeType = 'Intern';
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Job Type Chips Section
  Widget _buildJobTypeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: 'Job Type',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Expanded(
              child: _buildChip(
                label: 'Remote',
                isSelected: selectedJobType == 'Remote',
                selectedColor: AppColors.primaryColor,
                onTap: () {
                  setState(() {
                    selectedJobType = 'Remote';
                  });
                },
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: _buildChip(
                label: 'Onsite',
                isSelected: selectedJobType == 'Onsite',
                selectedColor: AppColors.primaryColor,
                onTap: () {
                  setState(() {
                    selectedJobType = 'Onsite';
                  });
                },
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: _buildChip(
                label: 'Hybrid',
                isSelected: selectedJobType == 'Hybrid',
                selectedColor: AppColors.primaryColor,
                onTap: () {
                  setState(() {
                    selectedJobType = 'Hybrid';
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Reusable Chip Widget
  Widget _buildChip({
    required String label,
    required bool isSelected,
    required Color selectedColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : AppColors.white,
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(
            color: isSelected ? selectedColor : AppColors.borderColor,
            width: 1,
          ),
        ),
        child: Center(
          child: CommonText(
            text: label,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: isSelected ? AppColors.white : AppColors.primaryText,
          ),
        ),
      ),
    );
  }

  // Salary Range Section
  Widget _buildSalaryRangeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: 'Salary Range',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: 'Min Salary',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondaryText,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 6.h),
                  CommonTextField(
                    controller: minSalaryController,
                    hintText: '\$5000',
                    keyboardType: TextInputType.number,
                    paddingVertical: 12,
                    paddingHorizontal: 12,
                    borderRadius: 4,
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: 'Most Salary',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondaryText,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 6.h),
                  CommonTextField(
                    controller: maxSalaryController,
                    hintText: '\$8000',
                    keyboardType: TextInputType.number,
                    paddingVertical: 12,
                    paddingHorizontal: 12,
                    borderRadius: 4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Distance Slider Section
  Widget _buildDistanceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: 'Distance',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            CommonText(
              text: 'km',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.secondaryText,
            ),
            Expanded(
              child: SliderTheme(
                data: SliderThemeData(
                  activeTrackColor: AppColors.primaryColor,
                  inactiveTrackColor: AppColors.borderColor,
                  thumbColor: AppColors.primaryColor,
                  overlayColor: AppColors.primaryColor.withOpacity(0.2),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.r),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 18.r),
                  trackHeight: 4.h,
                ),
                child: Slider(
                  value: distanceValue,
                  min: 0,
                  max: 50,
                  onChanged: (value) {
                    setState(() {
                      distanceValue = value;
                    });
                  },
                ),
              ),
            ),
            CommonText(
              text: '${distanceValue.toInt()} Km',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.secondaryText,
            ),
          ],
        ),
      ],
    );
  }

  // Apply Now Button
  Widget _buildApplyButton() {
    return CommonButton(
      titleText: 'Apply Now',
      buttonHeight: 48.h,
      buttonRadius: 4,
      titleSize: 16,
      titleWeight: FontWeight.w600,
      isGradient: true,
      onTap: () {
        // Handle apply filter logic
        Navigator.pop(context);
      },
    );
  }
}
