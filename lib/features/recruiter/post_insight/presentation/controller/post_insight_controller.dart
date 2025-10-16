import 'package:get/get.dart';
import 'package:embeyi/core/utils/constants/app_images.dart';

class PostInsightController extends GetxController {
  // Observable properties
  final RxString selectedJobTitle = 'UI/UX Designer'.obs;
  final RxString selectedTimePeriod = 'Last 30 Days'.obs;
  
  final RxList<Map<String, dynamic>> recentApplicants = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> recentQualified = <Map<String, dynamic>>[].obs;

  // Job title options
  final List<String> jobTitles = [
    'UI/UX Designer',
    'Web Designer',
    'Office Assistance',
    'Marketing Manager',
    'IT Executive',
  ];

  // Time period options
  final List<String> timePeriods = [
    'Last 7 Days',
    'Last 30 Days',
    'Last 90 Days',
    'Last Year',
  ];

  // Stats
  final RxInt applicationCount = 588.obs;
  final RxInt qualifiedCount = 120.obs;
  final RxString engagementRate = '90%'.obs;
  final RxInt rejectCount = 450.obs;

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  void _loadData() {
    recentApplicants.value = [
      {
        'name': 'Savannah Nguyen',
        'jobTitle': 'Sr. UI/UX Designer',
        'matchPercentage': 90,
        'profileImage': AppImages.profile,
      },
      {
        'name': 'Albert Flores',
        'jobTitle': 'Sr. UI/UX Designer',
        'matchPercentage': 70,
        'profileImage': AppImages.profile,
      },
      {
        'name': 'Floyd Miles',
        'jobTitle': 'Sr. UI/UX Designer',
        'matchPercentage': 40,
        'profileImage': AppImages.profile,
      },
    ];

    recentQualified.value = [
      {
        'name': 'Savannah Nguyen',
        'jobTitle': 'Sr. UI/UX Designer',
        'matchPercentage': 90,
        'profileImage': AppImages.profile,
      },
      {
        'name': 'Albert Flores',
        'jobTitle': 'Sr. UI/UX Designer',
        'matchPercentage': 85,
        'profileImage': AppImages.profile,
      },
    ];
  }

  void selectJobTitle(String jobTitle) {
    selectedJobTitle.value = jobTitle;
    // Reload data based on selected job
  }

  void selectTimePeriod(String period) {
    selectedTimePeriod.value = period;
    // Reload data based on selected period
  }

  void viewApplicantProfile(String name) {
    Get.snackbar('Applicant Profile', 'Opening $name profile...');
  }
}