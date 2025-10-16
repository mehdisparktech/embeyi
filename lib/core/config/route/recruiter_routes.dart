import 'package:embeyi/features/recruiter/home/presentation/screen/job_card_details_screen.dart';
import 'package:embeyi/features/recruiter/job_post/presentation/screen/edit_job_post_screen.dart';
import 'package:embeyi/features/recruiter/job_post/presentation/screen/job_post_screen.dart';
import 'package:embeyi/features/recruiter/job_post/presentation/screen/view_job_post_screen.dart';
import 'package:embeyi/features/recruiter/post_insight/presentation/screen/post_insight_screen.dart';
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
  static const String termsOfServices =
      "/recruiter_terms_of_services_screen.dart";
  static const String setting = "/recruiter_setting_screen.dart";
  static const String jobDetails = "/recruiter_job_details_screen.dart";
  static const String viewJobPost = "/view_job_post_screen.dart";
  static const String editJobPost = "/edit_job_post_screen.dart";
  static const String jobPost = "/job_post_screen.dart";
  static const String postInsight = "/post_insight_screen.dart";

  // Recruiter Routes List
  static List<GetPage> routes = [
    GetPage(name: home, page: () => RecruiterHomeScreen()),
    GetPage(
      name: notifications,
      page: () => const RecruiterNotificationScreen(),
    ),
    GetPage(name: chat, page: () => const RecruiterChatListScreen()),
    GetPage(name: profile, page: () => const RecruiterProfileScreen()),
    GetPage(name: editProfile, page: () => const RecruiterEditProfileScreen()),
    GetPage(
      name: privacyPolicy,
      page: () => const RecruiterPrivacyPolicyScreen(),
    ),
    GetPage(
      name: termsOfServices,
      page: () => const RecruiterTermsOfServicesScreen(),
    ),
    GetPage(name: setting, page: () => const RecruiterSettingScreen()),
    GetPage(name: jobDetails, page: () => const JobCardDetailsScreen()),
    GetPage(name: viewJobPost, page: () => const ViewJobPostScreen()),
    GetPage(name: editJobPost, page: () => const EditJobPostScreen()),
    GetPage(name: jobPost, page: () => const JobPostScreen()),
    GetPage(name: postInsight, page: () => const PostInsightScreen()),
  ];

  // Recruiter Navigation Helper Methods
  static void goToHome() => Get.toNamed(home);
  static void goToProfile() => Get.toNamed(profile);
  static void goToNotifications() => Get.toNamed(notifications);
  static void goToChat() => Get.toNamed(chat);
  static void goToSettings() => Get.toNamed(setting);
  static void goToPrivacyPolicy() => Get.toNamed(privacyPolicy);
  static void goToTermsOfServices() => Get.toNamed(termsOfServices);
  static void goToJobDetails() => Get.toNamed(jobDetails);
  static void goToViewJobPost() => Get.toNamed(viewJobPost);
  static void goToEditJobPost() => Get.toNamed(editJobPost);
  static void goToJobPost() => Get.toNamed(jobPost);
  static void goToPostInsight() => Get.toNamed(postInsight);
}
