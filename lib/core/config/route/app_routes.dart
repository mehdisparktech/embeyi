import 'package:embeyi/features/common/onboarding_screen/select_roule_screen.dart';
import 'package:get/get.dart';

// Common imports
import '../../../features/common/auth/change_password/presentation/screen/change_password_screen.dart';
import '../../../features/common/auth/forgot password/presentation/screen/create_password.dart';
import '../../../features/common/auth/forgot password/presentation/screen/forgot_password.dart';
import '../../../features/common/auth/forgot password/presentation/screen/verify_screen.dart';
import '../../../features/common/auth/sign in/presentation/screen/sign_in_screen.dart';
import '../../../features/common/auth/sign up/presentation/screen/sign_up_screen.dart';
import '../../../features/common/auth/sign up/presentation/screen/verify_user.dart';
import '../../../features/common/onboarding_screen/onboarding_screen.dart';
import '../../../features/common/splash/splash_screen.dart';

// Role-specific route imports
import 'job_seeker_routes.dart';
import 'recruiter_routes.dart';

class AppRoutes {
  // Common Routes
  static const String test = "/test_screen.dart";
  static const String splash = "/splash_screen.dart";
  static const String onboarding = "/onboarding_screen.dart";
  static const String signUp = "/sign_up_screen.dart";
  static const String verifyUser = "/verify_user.dart";
  static const String signIn = "/sign_in_screen.dart";
  static const String forgotPassword = "/forgot_password.dart";
  static const String verifyEmail = "/verify_screen.dart";
  static const String createPassword = "/create_password.dart";
  static const String changePassword = "/change_password_screen.dart";
  static const String selectedRole = "/selected_role_screen.dart";

  // Common Routes List
  static List<GetPage> routes = [
    // Common Routes
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: onboarding, page: () => const OnboardingScreen()),
    GetPage(name: signUp, page: () => SignUpScreen()),
    GetPage(name: verifyUser, page: () => const VerifyUser()),
    GetPage(name: signIn, page: () => SignInScreen()),
    GetPage(name: forgotPassword, page: () => ForgotPasswordScreen()),
    GetPage(name: verifyEmail, page: () => const VerifyScreen()),
    GetPage(name: createPassword, page: () => CreatePassword()),
    GetPage(name: changePassword, page: () => ChangePasswordScreen()),
    GetPage(name: selectedRole, page: () => const SelectRouleScreen()),

    // Role-specific routes
    ...JobSeekerRoutes.routes,
    ...RecruiterRoutes.routes,
  ];

  // Helper methods for navigation
  static void goToSplash() => Get.toNamed(splash);
  static void goToOnboarding() => Get.toNamed(onboarding);
  static void goToSignIn() => Get.toNamed(signIn);
  static void goToSignUp() => Get.toNamed(signUp);
  static void goToForgotPassword() => Get.toNamed(forgotPassword);
  static void goToChangePassword() => Get.toNamed(changePassword);
}
