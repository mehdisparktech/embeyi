import 'package:embeyi/core/component/pop_up/otp_pop_up.dart';
import 'package:embeyi/core/component/pop_up/password_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:embeyi/core/services/storage/storage_services.dart';
import 'package:embeyi/core/utils/helpers/other_helper.dart';

import '../../../../../core/config/api/api_end_point.dart';
import '../../../../../core/config/route/recruiter_routes.dart';
import '../../../../../core/services/api/api_service.dart';
import '../../../../../core/utils/app_utils.dart';

class RecruiterProfileController extends GetxController {
  /// Language List here
  List languages = ["English", "French", "Arabic"];

  /// form key here
  final formKey = GlobalKey<FormState>();

  /// select Language here
  String selectedLanguage = "English";

  /// select image here
  String? image;

  /// edit button loading here
  bool isLoading = false;

  /// all controller here
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  /// select image function here
  getProfileImage() async {
    image = await OtherHelper.openGalleryForProfile();
    update();
  }

  /// select language  function here
  selectLanguage(int index) {
    selectedLanguage = languages[index];
    update();
    Get.back();
  }

  /// update profile function here
  Future<void> editProfileRepo() async {
    if (!formKey.currentState!.validate()) return;

    if (!LocalStorage.isLogIn) return;
    isLoading = true;
    update();

    Map<String, String> body = {
      "fullName": nameController.text,
      "phone": numberController.text,
    };

    var response = await ApiService.multipart(
      ApiEndPoint.user,
      body: body,
      imagePath: image,
      imageName: "image",
    );

    if (response.statusCode == 200) {
      var data = response.data;

      LocalStorage.userId = data['data']?["_id"] ?? "";
      LocalStorage.myImage = data['data']?["image"] ?? "";
      LocalStorage.myName = data['data']?["fullName"] ?? "";
      LocalStorage.myEmail = data['data']?["email"] ?? "";

      LocalStorage.setString("userId", LocalStorage.userId);
      LocalStorage.setString("myImage", LocalStorage.myImage);
      LocalStorage.setString("myName", LocalStorage.myName);
      LocalStorage.setString("myEmail", LocalStorage.myEmail);

      Utils.successSnackBar("Successfully Profile Updated", response.message);
      Get.toNamed(RecruiterRoutes.profile);
    } else {
      Utils.errorSnackBar(response.statusCode, response.message);
    }

    isLoading = false;
    update();
  }

  static void showPaymentHistoryPopUp() {
    _showPasswordPopUp();
  }

  static void _showPasswordPopUp() {
    TextEditingController passwordController = TextEditingController();
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) => PasswordPopUp(
        passwordController: passwordController,
        onContinue: () {
          // Handle password submission
          String password = passwordController.text;
          print('Password entered: $password');
          Navigator.pop(context);
          _showOtpPopUp();
          // Navigate to next screen or perform action
        },
      ),
    );
  }

  static void _showOtpPopUp() {
    List<TextEditingController> otpControllers = [];
    for (int i = 0; i < 4; i++) {
      otpControllers.add(TextEditingController());
    }
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) => OtpPopUp(
        controllers: otpControllers,
        onVerify: () {
          // Handle OTP verification
          String otp = otpControllers
              .map((controller) => controller.text)
              .join();
          // ignore: avoid_print
          print('OTP entered: $otp');
          Navigator.pop(context);
          RecruiterRoutes.goToPaymentHistory();
        },
        onResend: () {
          // Handle resend OTP
          for (var controller in otpControllers) {
            controller.clear();
          }
          // Call API to resend OTP
        },
      ),
    );
  }
}
