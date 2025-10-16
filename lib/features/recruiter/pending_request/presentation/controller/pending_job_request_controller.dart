import 'package:get/get.dart';
import 'package:embeyi/core/utils/constants/app_images.dart';

class PendingJobRequestController extends GetxController {
  // Observable properties
  final RxString selectedJobTitle = 'Sr. UI/UX Designer'.obs;
  final RxList<Map<String, dynamic>> pendingRequests = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> filteredRequests = <Map<String, dynamic>>[].obs;

  // Job title options for dropdown
  final List<String> jobTitles = [
    'Sr. UI/UX Designer',
    'Web Designer',
    'Office Assistance',
    'Frontend Developer',
    'Backend Developer',
  ];

  @override
  void onInit() {
    super.onInit();
    _loadPendingRequests();
    _applyFilter();
  }

  void _loadPendingRequests() {
    pendingRequests.value = [
      {
        'name': 'Devon Lane',
        'jobTitle': 'Sr. UI/UX Designer',
        'experience': '5 Years Experience',
        'description':
            'A Dedicated And Reliable Professional With Strong Teamwork And Problem Solving Skills, Committed To Delivering Quality Results On Time',
        'matchPercentage': 90,
        'profileImage': AppImages.profile,
      },
      {
        'name': 'Jerome Bell',
        'jobTitle': 'Sr. UI/UX Designer',
        'experience': '5 Years Experience',
        'description':
            'A Dedicated And Reliable Professional With Strong Teamwork And Problem Solving Skills, Committed To Delivering Quality Results On Time',
        'matchPercentage': 70,
        'profileImage': AppImages.profile,
      },
      {
        'name': 'Arlene McCoy',
        'jobTitle': 'Sr. UI/UX Designer',
        'experience': '5 Years Experience',
        'description':
            'A Dedicated And Reliable Professional With Strong Teamwork And Problem Solving Skills, Committed To Delivering Quality Results On Time',
        'matchPercentage': 40,
        'profileImage': AppImages.profile,
      },
      {
        'name': 'Courtney Henry',
        'jobTitle': 'Sr. UI/UX Designer',
        'experience': '5 Years Experience',
        'description':
            'A Dedicated And Reliable Professional With Strong Teamwork And Problem Solving Skills, Committed To Delivering Quality Results On Time',
        'matchPercentage': 70,
        'profileImage': AppImages.profile,
      },
      {
        'name': 'Wade Warren',
        'jobTitle': 'Web Designer',
        'experience': '3 Years Experience',
        'description':
            'A Dedicated And Reliable Professional With Strong Teamwork And Problem Solving Skills, Committed To Delivering Quality Results On Time',
        'matchPercentage': 85,
        'profileImage': AppImages.profile,
      },
      {
        'name': 'Albert Flores',
        'jobTitle': 'Web Designer',
        'experience': '4 Years Experience',
        'description':
            'A Dedicated And Reliable Professional With Strong Teamwork And Problem Solving Skills, Committed To Delivering Quality Results On Time',
        'matchPercentage': 75,
        'profileImage': AppImages.profile,
      },
    ];
  }

  void selectJobTitle(String jobTitle) {
    selectedJobTitle.value = jobTitle;
    _applyFilter();
  }

  void _applyFilter() {
    filteredRequests.value = pendingRequests
        .where((request) => request['jobTitle'] == selectedJobTitle.value)
        .toList();
  }

  int get totalRequestCount => filteredRequests.length;

  void viewCandidateProfile(String candidateName) {
    // Handle candidate profile view
    Get.snackbar('Candidate Profile', 'Opening $candidateName profile...');
  }
}
