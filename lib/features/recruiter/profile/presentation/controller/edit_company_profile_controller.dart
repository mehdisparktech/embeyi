import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:embeyi/core/utils/constants/app_images.dart';
import 'package:image_picker/image_picker.dart';

class EditCompanyProfileController extends GetxController {
  // Text editing controllers
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController overviewController = TextEditingController();

  // Image picker
  final ImagePicker _picker = ImagePicker();

  // Observable states
  final RxString coverPhotoPath = ''.obs;
  final RxString companyLogoPath = ''.obs;
  final RxList<String> galleryImages = <String>[].obs;
  final RxList<int> selectedImageIndices = <int>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize with sample data
    companyNameController.text = 'Design Hill';
    overviewController.text = 'Marketing That Performs. Web Social. And Paid Ads By A Google Partner & B Corp Agency.';
    
    // Initialize gallery with sample images
    galleryImages.addAll([
      AppImages.jobPost,
      AppImages.jobPost,
      AppImages.jobPost,
      AppImages.jobPost,
      AppImages.jobPost,
      AppImages.jobPost,
    ]);
    
    // Mark some images as selected
    selectedImageIndices.addAll([1, 3, 4, 5]);
  }

  @override
  void onClose() {
    companyNameController.dispose();
    overviewController.dispose();
    super.onClose();
  }

  // Pick cover photo
  Future<void> pickCoverPhoto() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      coverPhotoPath.value = image.path;
    }
  }

  // Pick company logo
  Future<void> pickCompanyLogo() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      companyLogoPath.value = image.path;
    }
  }

  // Add image to gallery
  Future<void> addGalleryImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      galleryImages.add(image.path);
    }
  }

  // Toggle image selection
  void toggleImageSelection(int index) {
    if (selectedImageIndices.contains(index)) {
      selectedImageIndices.remove(index);
    } else {
      selectedImageIndices.add(index);
    }
  }

  // Check if image is selected
  bool isImageSelected(int index) {
    return selectedImageIndices.contains(index);
  }

  // Update profile
  void updateProfile() {
    // Implement update logic here
    Get.snackbar(
      'Success',
      'Profile updated successfully',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
