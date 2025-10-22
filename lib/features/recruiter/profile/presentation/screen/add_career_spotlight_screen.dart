import 'package:embeyi/core/component/appbar/common_appbar.dart';
import 'package:embeyi/core/component/button/common_button.dart';
import 'package:embeyi/core/component/image/common_image.dart';
import 'package:embeyi/core/component/text/common_text.dart';
import 'package:embeyi/core/component/text_field/common_text_field.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCareerSpotlightScreen extends StatefulWidget {
  const AddCareerSpotlightScreen({super.key});

  @override
  State<AddCareerSpotlightScreen> createState() =>
      _AddCareerSpotlightScreenState();
}

class _AddCareerSpotlightScreenState extends State<AddCareerSpotlightScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _organizationNameController =
      TextEditingController();
  final TextEditingController _jobTitleController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  // Dropdown values
  String? _selectedJobType;
  String? _selectedFocusArea;
  String? _selectedJobRole;
  String? _selectedLocation;
  String? _selectedPlacementType;
  String? _selectedMode;

  // Date values
  DateTime? _startDate;
  DateTime? _endDate;

  // Dropdown options
  final List<String> _jobTypes = [
    'Training Program',
    'Hiring',
    'Staffing',
    'Career Coaching',
    'Resume Service',
  ];

  final List<String> _focusAreas = [
    'Cybersecurity',
    'Data Engineering',
    'Technology',
    'Cloud',
  ];

  final List<String> _jobRoles = ['Onsite', 'In-Person', 'Hybrid'];

  final List<String> _locations = ['Dhaka', 'Chittagong', 'Sylhet'];

  final List<String> _placementTypes = [
    'Tuition',
    'Placement Fee',
    'Free Trial',
  ];

  final List<String> _modes = ['Email', 'Phone', 'Website'];

  @override
  void dispose() {
    _organizationNameController.dispose();
    _jobTitleController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppbar(
        title: 'Career Spotlight',
        showLeading: true,
        backgroundColor: AppColors.white,
        textColor: AppColors.black,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 24.h),

                        // Upload Cover Image Section
                        _buildUploadCoverImageSection(),

                        SizedBox(height: 24.h),

                        // Organization Name
                        _buildLabel('Organization Name'),
                        SizedBox(height: 8.h),
                        CommonTextField(
                          controller: _organizationNameController,
                          hintText: 'Example',
                          fillColor: AppColors.white,
                          borderColor: AppColors.borderColor,
                        ),

                        SizedBox(height: 16.h),

                        // Which Type
                        _buildLabel('Which Type'),
                        SizedBox(height: 8.h),
                        _buildDropdown(
                          value: _selectedJobType,
                          hint: 'Training Program',
                          items: _jobTypes,
                          onChanged: (value) {
                            setState(() {
                              _selectedJobType = value;
                            });
                          },
                        ),

                        SizedBox(height: 16.h),

                        // Focus Area / Specialty
                        _buildLabel('Focus Area / Specialty'),
                        SizedBox(height: 8.h),
                        _buildDropdown(
                          value: _selectedFocusArea,
                          hint: 'Cybersecurity',
                          items: _focusAreas,
                          onChanged: (value) {
                            setState(() {
                              _selectedFocusArea = value;
                            });
                          },
                        ),

                        SizedBox(height: 16.h),

                        // Job Role
                        _buildLabel('Job Role'),
                        SizedBox(height: 8.h),
                        _buildDropdown(
                          value: _selectedJobRole,
                          hint: 'Onsite',
                          items: _jobRoles,
                          onChanged: (value) {
                            setState(() {
                              _selectedJobRole = value;
                            });
                          },
                        ),

                        SizedBox(height: 16.h),

                        // Location
                        _buildLabel('Location'),
                        SizedBox(height: 8.h),
                        _buildDropdown(
                          value: _selectedLocation,
                          hint: 'Dhaka',
                          items: _locations,
                          onChanged: (value) {
                            setState(() {
                              _selectedLocation = value;
                            });
                          },
                        ),

                        SizedBox(height: 16.h),

                        // Placement Fee
                        _buildLabel('Placement Fee'),
                        SizedBox(height: 8.h),
                        _buildDropdown(
                          value: _selectedPlacementType,
                          hint: 'Tuition',
                          items: _placementTypes,
                          onChanged: (value) {
                            setState(() {
                              _selectedPlacementType = value;
                            });
                          },
                        ),

                        SizedBox(height: 16.h),

                        // Start Date and End Date Row
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildLabel('Start Date'),
                                  SizedBox(height: 8.h),
                                  _buildDateField(
                                    date: _startDate,
                                    hint: '07 Jan 2025',
                                    onTap: () => _selectDate(context, true),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildLabel('End Date'),
                                  SizedBox(height: 8.h),
                                  _buildDateField(
                                    date: _endDate,
                                    hint: '15 Jan 2025',
                                    onTap: () => _selectDate(context, false),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 16.h),

                        // Start Time and End Time Row
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildLabel('Start Time'),
                                  SizedBox(height: 8.h),
                                  _buildTimeField(
                                    hint: '07 Jan 2025',
                                    onTap: () => _selectTime(context, true),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildLabel('End Time'),
                                  SizedBox(height: 8.h),
                                  _buildTimeField(
                                    hint: '15 Jan 2025',
                                    onTap: () => _selectTime(context, false),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 16.h),

                        // Email
                        _buildLabel('Email'),
                        SizedBox(height: 8.h),
                        _buildDropdown(
                          value: _selectedMode,
                          hint: 'Email',
                          items: _modes,
                          onChanged: (value) {
                            setState(() {
                              _selectedMode = value;
                            });
                          },
                        ),

                        SizedBox(height: 16.h),

                        // Email Input
                        CommonTextField(
                          controller: _emailController,
                          hintText: 'example@gmail.com',
                          fillColor: AppColors.white,
                          borderColor: AppColors.borderColor,
                          keyboardType: TextInputType.emailAddress,
                        ),

                        SizedBox(height: 32.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Continue Button
            Padding(
              padding: EdgeInsets.all(16.w),
              child: CommonButton(
                titleText: 'Continue',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle form submission
                  }
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
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryText,
      textAlign: TextAlign.left,
    );
  }

  Widget _buildUploadCoverImageSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: const Color(0xFF123499)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonImage(imageSrc: AppIcons.upload2, size: 48.sp),
          SizedBox(height: 12.h),
          CommonText(
            text: 'Upload Cover Image',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown({
    required String? value,
    required String hint,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 14.h,
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 14.sp,
            color: AppColors.textFiledColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: AppColors.primaryText,
          size: 20.sp,
        ),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.primaryText,
                fontWeight: FontWeight.w400,
              ),
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildDateField({
    required DateTime? date,
    required String hint,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              date != null
                  ? '${date.day.toString().padLeft(2, '0')} ${_getMonthName(date.month)} ${date.year}'
                  : hint,
              style: TextStyle(
                fontSize: 14.sp,
                color: date != null
                    ? AppColors.primaryText
                    : AppColors.textFiledColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            Icon(
              Icons.calendar_today_outlined,
              color: AppColors.primaryText,
              size: 16.sp,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeField({required String hint, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              hint,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.textFiledColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            Icon(Icons.access_time, color: AppColors.primaryText, size: 16.sp),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryColor,
              onPrimary: AppColors.white,
              onSurface: AppColors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryColor,
              onPrimary: AppColors.white,
              onSurface: AppColors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      // Handle time selection
    }
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
}
