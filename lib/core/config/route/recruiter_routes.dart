import 'package:get/get.dart';

// Recruiter imports
import '../../../features/recruiter/home/presentation/screen/recruiter_home_screen.dart';
import '../../../features/recruiter/message/presentation/screen/recruiter_chat_screen.dart';
import '../../../features/recruiter/notifications/presentation/screen/recruiter_notifications_screen.dart';
import '../../../features/recruiter/profile/presentation/screen/recruiter_profile_screen.dart';
import '../../../features/recruiter/profile/presentation/screen/edit_profile.dart';
import '../../../features/recruiter/setting/presentation/screen/recruiter_privacy_policy_screen.dart';
import '../../../features/recruiter/setting/presentation/screen/recruiter_setting_screen.dart';
import '../../../features/recruiter/setting/presentation/screen/recruiter_terms_of_services_screen.dart';

class RecruiterRoutes {
  // Recruiter Route Constants
  static const String home = "/recruiter_home_screen.dart";
  static const String notifications = "/recruiter_notifications_screen.dart";
  static const String chat = "/recruiter_chat_screen.dart";
  static const String profile = "/recruiter_profile_screen.dart";
  static const String editProfile = "/recruiter_edit_profile_screen.dart";
  static const String privacyPolicy = "/recruiter_privacy_policy_screen.dart";
  static const String termsOfServices = "/recruiter_terms_of_services_screen.dart";
  static const String setting = "/recruiter_setting_screen.dart";

  // Recruiter Routes List
  static List<GetPage> routes = [
    GetPage(name: home, page: () => RecruiterHomeScreen()),
    GetPage(name: notifications, page: () => const RecruiterNotificationScreen()),
    GetPage(name: chat, page: () => const RecruiterChatListScreen()),
    GetPage(name: profile, page: () => const RecruiterProfileScreen()),
    GetPage(name: editProfile, page: () => const RecruiterEditProfileScreen()),
    GetPage(name: privacyPolicy, page: () => const RecruiterPrivacyPolicyScreen()),
    GetPage(name: termsOfServices, page: () => const RecruiterTermsOfServicesScreen()),
    GetPage(name: setting, page: () => const RecruiterSettingScreen()),
  ];

  // Recruiter Navigation Helper Methods
  static void goToHome() => Get.toNamed(home);
  static void goToProfile() => Get.toNamed(profile);
  static void goToNotifications() => Get.toNamed(notifications);
  static void goToChat() => Get.toNamed(chat);
  static void goToSettings() => Get.toNamed(setting);
  static void goToPrivacyPolicy() => Get.toNamed(privacyPolicy);
  static void goToTermsOfServices() => Get.toNamed(termsOfServices);
}