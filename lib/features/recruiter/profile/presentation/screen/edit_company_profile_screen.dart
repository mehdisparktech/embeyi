import 'dart:io';
import 'package:embeyi/core/component/appbar/common_appbar.dart';
import 'package:embeyi/core/component/button/common_button.dart';
import 'package:embeyi/core/component/image/common_image.dart';
import 'package:embeyi/core/component/text/common_text.dart';
import 'package:embeyi/core/component/text_field/common_text_field.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/constants/app_images.dart';
import 'package:embeyi/core/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/edit_company_profile_controller.dart';

class EditCompanyProfileScreen extends StatelessWidget {
  const EditCompanyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditCompanyProfileController());

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppbar(
        title: 'Edit Profile',
        textColor: AppColors.black,
        backgroundColor: AppColors.white,
        showBackButton: true,
        leading: const BackButton(color: AppColors.black),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Cover Photo Section with Logo
                  _buildCoverPhotoSection(controller),

                  50.height,

                  // Form Fields
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Company Name Field
                        CommonText(
                          text: 'Company Name',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                          textAlign: TextAlign.start,
                        ),
                        8.height,
                        CommonTextField(
                          controller: controller.companyNameController,
                          hintText: 'Enter company name',
                          borderRadius: 8,
                          fillColor: AppColors.white,
                          borderColor: AppColors.borderColor,
                        ),

                        16.height,

                        // Overview Field
                        CommonText(
                          text: 'Overview',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                          textAlign: TextAlign.start,
                        ),
                        8.height,
                        CommonTextField(
                          controller: controller.overviewController,
                          hintText: 'Enter company overview',
                          maxLines: 4,
                          borderRadius: 8,
                          fillColor: AppColors.white,
                          borderColor: AppColors.borderColor,
                          textInputAction: TextInputAction.newline,
                        ),

                        20.height,

                        // Gallery Section
                        CommonText(
                          text: 'Gallary',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                          textAlign: TextAlign.start,
                        ),
                        12.height,
                        _buildGallerySection(controller),

                        20.height,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Update Button
          Padding(
            padding: EdgeInsets.all(16.w),
            child: CommonButton(
              titleText: 'Update',
              onTap: controller.updateProfile,
              buttonHeight: 48.h,
              titleSize: 16,
              titleWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCoverPhotoSection(EditCompanyProfileController controller) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Cover Photo
        Obx(
          () => GestureDetector(
            onTap: controller.pickCoverPhoto,
            child: Container(
              width: double.infinity,
              height: 180.h,
              decoration: BoxDecoration(color: AppColors.filledColor),
              child: controller.coverPhotoPath.value.isEmpty
                  ? CommonImage(
                      imageSrc: AppImages.imageBackground,
                      fill: BoxFit.cover,
                      height: 180.h,
                      width: double.infinity,
                    )
                  : Image.file(
                      File(controller.coverPhotoPath.value),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 180.h,
                    ),
            ),
          ),
        ),

        // Edit Cover Photo Button
        Positioned(
          bottom: 12.h,
          right: 12.w,
          child: GestureDetector(
            onTap: controller.pickCoverPhoto,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(4.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommonText(
                    text: 'Edit Cover Photo',
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ),

        // Company Logo
        Positioned(
          left: 0,
          right: 0,
          bottom: -40.h,
          child: Center(
            child: Column(
              children: [
                Obx(
                  () => GestureDetector(
                    onTap: controller.pickCompanyLogo,
                    child: Stack(
                      children: [
                        Container(
                          width: 80.w,
                          height: 80.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white,
                            border: Border.all(
                              color: AppColors.white,
                              width: 3.w,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: controller.companyLogoPath.value.isEmpty
                                ? CommonImage(
                                    imageSrc: AppImages.companyLogo,
                                    fill: BoxFit.cover,
                                    width: 80.w,
                                    height: 80.w,
                                  )
                                : Image.file(
                                    File(controller.companyLogoPath.value),
                                    fit: BoxFit.cover,
                                    width: 80.w,
                                    height: 80.w,
                                  ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: controller.pickCompanyLogo,
                            child: Container(
                              width: 24.w,
                              height: 24.w,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.primaryColor,
                                  width: 1.5.w,
                                ),
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                size: 16.sp,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                8.height,

                // // Camera Icon
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGallerySection(EditCompanyProfileController controller) {
    return Obx(
      () => GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
          childAspectRatio: 1,
        ),
        itemCount: controller.galleryImages.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildAddImageButton(controller);
          }
          return _buildGalleryImageItem(controller, index - 1);
        },
      ),
    );
  }

  Widget _buildAddImageButton(EditCompanyProfileController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: controller.addGalleryImage,
          child: Container(
            width: Get.width * 0.7,
            height: Get.width * 0.2,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColors.borderColor, width: 1.w),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, size: 32.sp, color: AppColors.borderColor),
                8.height,
                CommonText(
                  text: 'Add Image',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.secondaryText,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGalleryImageItem(
    EditCompanyProfileController controller,
    int index,
  ) {
    return Obx(
      () => GestureDetector(
        onTap: () => controller.toggleImageSelection(index),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: controller.isImageSelected(index)
                      ? AppColors.primaryColor
                      : AppColors.borderColor,
                  width: 2.w,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6.r),
                child: controller.galleryImages[index].startsWith('/')
                    ? Image.file(
                        File(controller.galleryImages[index]),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      )
                    : CommonImage(
                        imageSrc: controller.galleryImages[index],
                        fill: BoxFit.cover,
                      ),
              ),
            ),
            // Selection Badge
            if (controller.isImageSelected(index))
              Positioned(
                top: 8.h,
                right: 8.w,
                child: Container(
                  width: 12.w,
                  height: 12.w,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.close,
                    size: 8.sp,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
