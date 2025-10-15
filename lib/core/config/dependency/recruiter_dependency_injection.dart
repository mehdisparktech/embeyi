import 'package:embeyi/features/recruiter/home/presentation/controller/home_controller.dart';
import 'package:embeyi/features/recruiter/message/presentation/controller/chat_controller.dart';
import 'package:embeyi/features/recruiter/message/presentation/controller/message_controller.dart';
import 'package:embeyi/features/recruiter/notifications/presentation/controller/notifications_controller.dart';
import 'package:embeyi/features/recruiter/profile/presentation/controller/profile_controller.dart';
import 'package:embeyi/features/recruiter/setting/presentation/controller/privacy_policy_controller.dart';
import 'package:embeyi/features/recruiter/setting/presentation/controller/setting_controller.dart';
import 'package:embeyi/features/recruiter/setting/presentation/controller/terms_of_services_controller.dart';
import 'package:get/get.dart';

class RecruiterDependencyInjection extends Bindings {
  @override
  void dependencies() {
    /// Recruiter Dependency Injection
    Get.lazyPut(() => RecruiterHomeController(), fenix: true);
    Get.lazyPut(() => RecruiterNotificationsController(), fenix: true);
    Get.lazyPut(() => RecruiterChatController(), fenix: true);
    Get.lazyPut(() => RecruiterMessageController(), fenix: true);
    Get.lazyPut(() => RecruiterProfileController(), fenix: true);
    Get.lazyPut(() => RecruiterSettingController(), fenix: true);
    Get.lazyPut(() => RecruiterPrivacyPolicyController(), fenix: true);
    Get.lazyPut(() => RecruiterTermsOfServicesController(), fenix: true);
  }
}
