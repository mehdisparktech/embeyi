# EditCompanyProfileScreen - Usage Guide

## Quick Start

### Navigation
To navigate to the EditCompanyProfileScreen from anywhere in your app:

```dart
Get.to(() => const EditCompanyProfileScreen());
// or
Get.toNamed('/edit-company-profile'); // if route is configured
```

## Features Overview

### 1. Edit Cover Photo
**How it works:**
- Tap anywhere on the cover photo
- OR tap the "Edit Cover Photo" button
- Select image from gallery
- Image updates automatically

**Code Reference:**
```dart
controller.pickCoverPhoto(); // Opens image picker
```

### 2. Edit Company Logo
**How it works:**
- Tap the circular logo
- OR tap the camera icon below
- Select image from gallery
- Logo updates automatically

**Code Reference:**
```dart
controller.pickCompanyLogo(); // Opens image picker
```

### 3. Edit Company Name
**How it works:**
- Tap the company name field
- Type new company name
- Changes saved in controller

**Code Reference:**
```dart
controller.companyNameController.text; // Get value
```

### 4. Edit Overview
**How it works:**
- Tap the overview field
- Type company description (supports multiple lines)
- Press enter for new lines
- Changes saved in controller

**Code Reference:**
```dart
controller.overviewController.text; // Get value
```

### 5. Manage Gallery Images
**Add Images:**
- Tap the "Add Image" button
- Select image from gallery
- Image added to grid

**Select/Deselect Images:**
- Tap any gallery image to toggle selection
- Selected images show blue border + checkmark
- Tap again to deselect

**Code Reference:**
```dart
controller.addGalleryImage(); // Add new image
controller.toggleImageSelection(index); // Toggle selection
controller.isImageSelected(index); // Check if selected
```

### 6. Update Profile
**How it works:**
- Make all desired changes
- Tap the "Update" button
- Controller processes the update

**Code Reference:**
```dart
controller.updateProfile(); // Triggers update
```

## Customization

### Change Default Values
Edit the controller's `onInit()` method:

```dart
@override
void onInit() {
  super.onInit();
  companyNameController.text = 'Your Company Name';
  overviewController.text = 'Your company description';
}
```

### Modify Gallery Selection
Change the default selected images:

```dart
// In controller's onInit()
selectedImageIndices.addAll([0, 2, 4]); // Different indices
```

### Update Button Action
Implement your API call or navigation:

```dart
void updateProfile() {
  // Validate fields
  if (companyNameController.text.isEmpty) {
    Get.snackbar('Error', 'Company name required');
    return;
  }
  
  // Call API
  // await apiService.updateCompanyProfile(...);
  
  // Show success
  Get.snackbar('Success', 'Profile updated');
  
  // Navigate back
  Get.back();
}
```

## Integration Examples

### With API Service

```dart
void updateProfile() async {
  // Show loading
  Get.dialog(LoadingWidget(), barrierDismissible: false);
  
  try {
    // Prepare data
    final data = {
      'company_name': companyNameController.text,
      'overview': overviewController.text,
      'cover_photo': coverPhotoPath.value,
      'logo': companyLogoPath.value,
      'gallery_images': galleryImages,
      'selected_images': selectedImageIndices,
    };
    
    // API call
    final response = await ApiService.updateProfile(data);
    
    // Close loading
    Get.back();
    
    if (response.success) {
      Get.snackbar('Success', 'Profile updated successfully');
      Get.back(result: true); // Return to previous screen
    }
  } catch (e) {
    Get.back(); // Close loading
    Get.snackbar('Error', 'Failed to update profile');
  }
}
```

### With Form Validation

```dart
// Add to controller
final formKey = GlobalKey<FormState>();

String? validateCompanyName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Company name is required';
  }
  if (value.length < 3) {
    return 'Company name must be at least 3 characters';
  }
  return null;
}

String? validateOverview(String? value) {
  if (value == null || value.isEmpty) {
    return 'Overview is required';
  }
  if (value.length < 50) {
    return 'Overview must be at least 50 characters';
  }
  return null;
}

void updateProfile() {
  if (formKey.currentState!.validate()) {
    // Proceed with update
  }
}
```

Then wrap the form fields with Form widget:

```dart
Form(
  key: controller.formKey,
  child: Column(
    children: [
      CommonTextField(
        controller: controller.companyNameController,
        validator: controller.validateCompanyName,
      ),
      CommonTextField(
        controller: controller.overviewController,
        validator: controller.validateOverview,
      ),
    ],
  ),
)
```

### With Image Compression

```dart
Future<void> pickCoverPhoto() async {
  final XFile? image = await _picker.pickImage(
    source: ImageSource.gallery,
    maxWidth: 1920,
    maxHeight: 1080,
    imageQuality: 85, // Compress to 85%
  );
  if (image != null) {
    coverPhotoPath.value = image.path;
  }
}
```

### With Image Cropping

```dart
Future<void> pickCompanyLogo() async {
  final XFile? image = await _picker.pickImage(
    source: ImageSource.gallery,
  );
  
  if (image != null) {
    // Crop to square
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Logo',
          toolbarColor: AppColors.primaryColor,
          toolbarWidgetColor: Colors.white,
        ),
        IOSUiSettings(
          title: 'Crop Logo',
        ),
      ],
    );
    
    if (croppedFile != null) {
      companyLogoPath.value = croppedFile.path;
    }
  }
}
```

## Common Use Cases

### 1. Pre-fill from Existing Profile

```dart
@override
void onInit() {
  super.onInit();
  
  // Load from existing profile
  final profile = Get.arguments as CompanyProfile?;
  if (profile != null) {
    companyNameController.text = profile.name;
    overviewController.text = profile.overview;
    coverPhotoPath.value = profile.coverPhoto;
    companyLogoPath.value = profile.logo;
    galleryImages.value = profile.galleryImages;
    selectedImageIndices.value = profile.selectedImages;
  }
}
```

### 2. Detect Changes Before Exit

```dart
bool hasChanges() {
  return companyNameController.text != originalName ||
         overviewController.text != originalOverview ||
         coverPhotoPath.value.isNotEmpty ||
         companyLogoPath.value.isNotEmpty;
}

// In screen
WillPopScope(
  onWillPop: () async {
    if (controller.hasChanges()) {
      return await showExitConfirmDialog();
    }
    return true;
  },
  child: Scaffold(...),
)
```

### 3. Auto-save Draft

```dart
// In controller
Timer? _autoSaveTimer;

void startAutoSave() {
  _autoSaveTimer = Timer.periodic(
    Duration(seconds: 30),
    (_) => saveDraft(),
  );
}

void saveDraft() async {
  await SharedPreferences.getInstance().then((prefs) {
    prefs.setString('draft_company_name', companyNameController.text);
    prefs.setString('draft_overview', overviewController.text);
  });
}

@override
void onClose() {
  _autoSaveTimer?.cancel();
  super.onClose();
}
```

## Troubleshooting

### Images Not Showing
**Problem:** Gallery images showing placeholder  
**Solution:** Check image paths are correct and assets exist

```dart
// Debug
print('Image path: ${controller.galleryImages[index]}');
```

### Image Picker Not Working
**Problem:** Image picker doesn't open  
**Solution:** Add permissions to AndroidManifest.xml and Info.plist

**Android** (AndroidManifest.xml):
```xml
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.CAMERA"/>
```

**iOS** (Info.plist):
```xml
<key>NSPhotoLibraryUsageDescription</key>
<string>We need access to select photos</string>
<key>NSCameraUsageDescription</key>
<string>We need camera access</string>
```

### State Not Updating
**Problem:** UI not reflecting changes  
**Solution:** Ensure using Obx() wrapper

```dart
// Correct
Obx(() => Text(controller.companyNameController.text))

// Wrong (won't update)
Text(controller.companyNameController.text)
```

### Overflow Issues
**Problem:** Bottom overflow when keyboard opens  
**Solution:** Already handled with SingleChildScrollView + Column structure

## Performance Tips

1. **Image Size:** Compress images before upload
2. **Gallery Limit:** Consider limiting gallery to 20-30 images
3. **Auto-save:** Don't auto-save on every keystroke
4. **Lazy Loading:** Current implementation already uses it
5. **Cache Images:** CommonImage already handles caching

## Testing Checklist

- [ ] Navigate to screen successfully
- [ ] Cover photo picker opens
- [ ] Logo picker opens
- [ ] Text fields editable
- [ ] Gallery images show correctly
- [ ] Add image works
- [ ] Image selection toggles
- [ ] Update button triggers
- [ ] Scroll works smoothly
- [ ] Keyboard doesn't cause overflow
- [ ] Back button works
- [ ] State persists during scroll

---

**Need Help?**
Refer to the implementation documentation in `EDIT_PROFILE_IMPLEMENTATION.md`
