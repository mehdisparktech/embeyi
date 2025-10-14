import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/component/text/common_text.dart';
import '../../../../../../core/component/text_field/common_text_field.dart';
import '../../../../../../core/utils/extensions/extension.dart';

class CertificationScreen extends StatefulWidget {
  const CertificationScreen({super.key});

  @override
  State<CertificationScreen> createState() => _CertificationScreenState();
}

class _CertificationScreenState extends State<CertificationScreen> {
  final TextEditingController certificationNameController =
      TextEditingController();
  final TextEditingController issuingOrganizationController =
      TextEditingController();
  final TextEditingController issueDateController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController credentialIdController = TextEditingController();
  final TextEditingController credentialUrlController = TextEditingController();
  bool doesNotExpire = false;

  @override
  void dispose() {
    certificationNameController.dispose();
    issuingOrganizationController.dispose();
    issueDateController.dispose();
    expiryDateController.dispose();
    credentialIdController.dispose();
    credentialUrlController.dispose();
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
          text: 'Certification',
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
                      _buildLabel('Certification Name'),
                      8.height,
                      CommonTextField(
                        controller: certificationNameController,
                        hintText: 'e.g. Google UX Design Certificate',
                      ),
                      16.height,

                      _buildLabel('Issuing Organization'),
                      8.height,
                      CommonTextField(
                        controller: issuingOrganizationController,
                        hintText: 'e.g. Google',
                      ),
                      16.height,

                      _buildLabel('Issue Date'),
                      8.height,
                      CommonTextField(
                        controller: issueDateController,
                        hintText: 'Select issue date',
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
                            issueDateController.text =
                                '${date.month}/${date.year}';
                          }
                        },
                      ),
                      16.height,

                      Row(
                        children: [
                          Checkbox(
                            value: doesNotExpire,
                            onChanged: (value) {
                              setState(() {
                                doesNotExpire = value ?? false;
                                if (doesNotExpire) {
                                  expiryDateController.text = 'No Expiration';
                                } else {
                                  expiryDateController.clear();
                                }
                              });
                            },
                            activeColor: AppColors.primary,
                          ),
                          const CommonText(
                            text: 'This certification does not expire',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      16.height,

                      if (!doesNotExpire) ...[
                        _buildLabel('Expiry Date'),
                        8.height,
                        CommonTextField(
                          controller: expiryDateController,
                          hintText: 'Select expiry date',
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
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2050),
                            );
                            if (date != null) {
                              expiryDateController.text =
                                  '${date.month}/${date.year}';
                            }
                          },
                        ),
                        16.height,
                      ],

                      _buildLabel('Credential ID (Optional)'),
                      8.height,
                      CommonTextField(
                        controller: credentialIdController,
                        hintText: 'Enter credential ID',
                      ),
                      16.height,

                      _buildLabel('Credential URL (Optional)'),
                      8.height,
                      CommonTextField(
                        controller: credentialUrlController,
                        hintText: 'https://example.com/certificate',
                        keyboardType: TextInputType.url,
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
