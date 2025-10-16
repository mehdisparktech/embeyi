import 'package:embeyi/features/recruiter/home/presentation/screen/all_job_post_screen.dart';
import 'package:embeyi/features/recruiter/home/presentation/screen/job_card_details_screen.dart';
import 'package:embeyi/features/recruiter/job_post/presentation/screen/create_job_post_screen.dart';
import 'package:embeyi/features/recruiter/job_post/presentation/screen/edit_job_post_screen.dart';
import 'package:embeyi/features/recruiter/job_post/presentation/job_post_screen.dart';
import 'package:embeyi/features/recruiter/job_post/presentation/screen/view_job_post_screen.dart';
import 'package:embeyi/features/recruiter/post_insight/presentation/screen/post_insight_screen.dart';
import 'package:embeyi/features/recruiter/profile/presentation/screen/career_spotlight_screen.dart';
import 'package:embeyi/features/recruiter/profile/presentation/screen/company_profile_screen.dart';
import 'package:embeyi/features/recruiter/profile/presentation/screen/job_history_screen.dart';
import 'package:embeyi/features/recruiter/profile/presentation/screen/my_subscription_screen.dart';
import 'package:embeyi/features/recruiter/profile/presentation/screen/payment_history_screen.dart';
import 'package:embeyi/features/recruiter/profile/presentation/screen/platform_review_screen.dart';
import 'package:embeyi/features/recruiter/profile/presentation/screen/subscription_pack_screen.dart';
import 'package:get/get.dart';

// Recruiter imports
import '../../../features/recruiter/home/presentation/recruiter_home_screen.dart';
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
  static const String viewJobPost = "/view_job_post_screen.dart";
  static const String editJobPost = "/edit_job_post_screen.dart";
  static const String jobPost = "/job_post_screen.dart";
  static const String postInsight = "/post_insight_screen.dart";
  static const String companyProfile = "/company_profile_screen.dart";
  static const String subscriptionPack = "/subscription_pack_screen.dart";
  static const String mySubscription = "/my_subscription_screen.dart";
  static const String careerSpotlight = "/career_spotlight_screen.dart";
  static const String jobHistory = "/job_history_screen.dart";
  static const String paymentHistory = "/payment_history_screen.dart";
  static const String platformReview = "/platform_review_screen.dart";
  static const String settings = "/settings_screen.dart";
  static const String logout = "/logout_screen.dart";
  static const String deleteAccount = "/delete_account_screen.dart";
  static const String changePassword = "/change_password_screen.dart";
  static const String helpAndSupport = "/help_and_support_screen.dart";
  static const String createJobPost = "/create_job_post_screen.dart";
  static const String jobCardDetails = "/job_card_details_screen.dart";
  static const String allJobPost = "/all_job_post_screen.dart";
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
    GetPage(name: jobCardDetails, page: () => const JobCardDetailsScreen()),
    GetPage(name: viewJobPost, page: () => const ViewJobPostScreen()),
    GetPage(name: editJobPost, page: () => const EditJobPostScreen()),
    GetPage(name: jobPost, page: () => const JobPostScreen()),
    GetPage(name: postInsight, page: () => const PostInsightScreen()),
    GetPage(name: companyProfile, page: () => const CompanyProfileScreen()),
    GetPage(name: subscriptionPack, page: () => const SubscriptionPackScreen()),
    GetPage(name: mySubscription, page: () => const MySubscriptionScreen()),
    GetPage(name: careerSpotlight, page: () => const CareerSpotlightScreen()),
    GetPage(name: jobHistory, page: () => const JobHistoryScreen()),
    GetPage(name: paymentHistory, page: () => const PaymentHistoryScreen()),
    GetPage(name: platformReview, page: () => const PlatformReviewScreen()),
    GetPage(name: createJobPost, page: () => const CreateJobPostScreen()),
    GetPage(name: allJobPost, page: () => const AllJobPostScreen()),
  ];

  // Recruiter Navigation Helper Methods
  static void goToHome() => Get.toNamed(home);
  static void goToProfile() => Get.toNamed(profile);
  static void goToNotifications() => Get.toNamed(notifications);
  static void goToChat() => Get.toNamed(chat);
  static void goToSettings() => Get.toNamed(setting);
  static void goToPrivacyPolicy() => Get.toNamed(privacyPolicy);
  static void goToTermsOfServices() => Get.toNamed(termsOfServices);
  static void goToViewJobPost() => Get.toNamed(viewJobPost);
  static void goToEditJobPost() => Get.toNamed(editJobPost);
  static void goToJobPost() => Get.toNamed(jobPost);
  static void goToPostInsight() => Get.toNamed(postInsight);
  static void goToCompanyProfile() => Get.toNamed(companyProfile);
  static void goToSubscriptionPack() => Get.toNamed(subscriptionPack);
  static void goToMySubscription() => Get.toNamed(mySubscription);
  static void goToCareerSpotlight() => Get.toNamed(careerSpotlight);
  static void goToJobHistory() => Get.toNamed(jobHistory);
  static void goToPaymentHistory() => Get.toNamed(paymentHistory);
  static void goToPlatformReview() => Get.toNamed(platformReview);
  static void goToCreateJobPost() => Get.toNamed(createJobPost);
  static void goToJobCardDetails() => Get.toNamed(jobCardDetails);
  static void goToAllJobPost() => Get.toNamed(allJobPost);
}
