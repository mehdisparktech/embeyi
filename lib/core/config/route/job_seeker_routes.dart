import 'package:embeyi/features/job_seeker/history/presentation/screen/history_screen.dart';
import 'package:embeyi/features/job_seeker/home/presentation/screen/job_seeker_home_screen.dart';
import 'package:embeyi/features/job_seeker/jobs/presentation/screen/jobs_screen.dart';
import 'package:get/get.dart';

// Job Seeker imports
import '../../../features/job_seeker/message/presentation/screen/job_seeker_chat_screen.dart';
import '../../../features/job_seeker/message/presentation/screen/message_screen.dart';
import '../../../features/job_seeker/notifications/presentation/screen/job_seeker_notifications_screen.dart';
import '../../../features/job_seeker/profile/presentation/screen/job_seeker_profile_screen.dart';
import '../../../features/job_seeker/profile/presentation/screen/edit_profile.dart';
import '../../../features/job_seeker/setting/presentation/screen/job_seeker_privacy_policy_screen.dart';
import '../../../features/job_seeker/setting/presentation/screen/job_seeker_setting_screen.dart';
import '../../../features/job_seeker/setting/presentation/screen/job_seeker_terms_of_services_screen.dart';

class JobSeekerRoutes {
  // Job Seeker Route Constants
  static const String home = "/job_seeker_home_screen.dart";
  static const String notifications = "/job_seeker_notifications_screen.dart";
  static const String chat = "/job_seeker_chat_screen.dart";
  static const String message = "/message_screen.dart";
  static const String profile = "/job_seeker_profile_screen.dart";
  static const String editProfile = "/edit_profile.dart";
  static const String privacyPolicy = "/job_seeker_privacy_policy_screen.dart";
  static const String termsOfServices =
      "/job_seeker_terms_of_services_screen.dart";
  static const String setting = "/job_seeker_setting_screen.dart";
  static const String jobs = "/job_seeker_jobs_screen.dart";
  static const String history = "/job_seeker_history_screen.dart";
  // Job Seeker Routes List
  static List<GetPage> routes = [
    GetPage(name: home, page: () => JobSeekerHomeScreen()),
    GetPage(
      name: notifications,
      page: () => const JobSeekerNotificationScreen(),
    ),
    GetPage(name: chat, page: () => const JobSeekerChatListScreen()),
    GetPage(name: message, page: () => const MessageScreen()),
    GetPage(name: profile, page: () => const JobSeekerProfileScreen()),
    GetPage(name: editProfile, page: () => JobSeekerEditProfile()),
    GetPage(
      name: privacyPolicy,
      page: () => const JobSeekerPrivacyPolicyScreen(),
    ),
    GetPage(
      name: termsOfServices,
      page: () => const JobSeekerTermsOfServicesScreen(),
    ),
    GetPage(name: setting, page: () => const JobSeekerSettingScreen()),
    GetPage(name: jobs, page: () => JobsScreen()),
    GetPage(name: history, page: () => HistoryScreen()),
  ];

  // Job Seeker Navigation Helper Methods
  static void goToHome() => Get.toNamed(home);
  static void goToProfile() => Get.toNamed(profile);
  static void goToNotifications() => Get.toNamed(notifications);
  static void goToChat() => Get.toNamed(chat);
  static void goToSettings() => Get.toNamed(setting);
  static void goToPrivacyPolicy() => Get.toNamed(privacyPolicy);
  static void goToTermsOfServices() => Get.toNamed(termsOfServices);
  static void goToJobs() => Get.toNamed(jobs);
  static void goToHistory() => Get.toNamed(history);
}
