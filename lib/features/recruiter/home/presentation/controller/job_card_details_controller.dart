import 'package:embeyi/core/config/route/recruiter_routes.dart';
import 'package:get/get.dart';
import 'package:embeyi/core/utils/constants/app_images.dart';

class JobCardDetailsController extends GetxController {
  // Observable properties
  final RxString selectedFilter = 'Candidate (150)'.obs;
  final RxBool isSaved = false.obs;
  final RxList<Map<String, dynamic>> candidates = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> filteredCandidates =
      <Map<String, dynamic>>[].obs;

  // Job details
  final jobTitle = 'Sr. UI/UX Designer'.obs;
  final location = 'California, United State.'.obs;
  final candidateCount = 150.obs;
  final deadline = '01 Dec 25'.obs;
  final isRemote = true.obs;

  // Filter options
  final List<String> filters = [
    'Candidate (150)',
    '70-80% MATCH',
    '80-90% Match',
    '90-95+',
  ];

  @override
  void onInit() {
    super.onInit();
    _loadMockCandidates();
    _applyFilter();
  }

  void _loadMockCandidates() {
    candidates.value = [
      {
        'name': 'Ronald Richards',
        'jobTitle': 'Sr. UI/UX Designer',
        'experience': '5 Years Experience',
        'description':
            'A Dedicated And Reliable Professional With Strong Teamwork And Problem Solving Skills, Committed To Delivering Quality Results On Time',
        'matchPercentage': 90,
        'profileImage': AppImages.profile,
      },
      {
        'name': 'Albert Flores',
        'jobTitle': 'Sr. UI/UX Designer',
        'experience': '5 Years Experience',
        'description':
            'A Dedicated And Reliable Professional With Strong Teamwork And Problem Solving Skills, Committed To Delivering Quality Results On Time',
        'matchPercentage': 70,
        'profileImage': AppImages.profile,
      },
      {
        'name': 'Cody Fisher',
        'jobTitle': 'Sr. UI/UX Designer',
        'experience': '5 Years Experience',
        'description':
            'A Dedicated And Reliable Professional With Strong Teamwork And Problem Solving Skills, Committed To Delivering Quality Results On Time',
        'matchPercentage': 40,
        'profileImage': AppImages.profile,
      },
      {
        'name': 'Theresa Webb',
        'jobTitle': 'Sr. UI/UX Designer',
        'experience': '5 Years Experience',
        'description':
            'A Dedicated And Reliable Professional With Strong Teamwork And Problem Solving Skills, Committed To Delivering Quality Results On Time',
        'matchPercentage': 78,
        'profileImage': AppImages.profile,
      },
      {
        'name': 'Wade Warren',
        'jobTitle': 'Sr. UI/UX Designer',
        'experience': '5 Years Experience',
        'description':
            'A Dedicated And Reliable Professional With Strong Teamwork And Problem Solving Skills, Committed To Delivering Quality Results On Time',
        'matchPercentage': 81,
        'profileImage': AppImages.profile,
      },
    ];
  }

  void selectFilter(String filter) {
    selectedFilter.value = filter;
    _applyFilter();
  }

  void _applyFilter() {
    if (selectedFilter.value == 'Candidate (150)') {
      filteredCandidates.value = candidates;
    } else if (selectedFilter.value == '70-80% MATCH') {
      filteredCandidates.value = candidates
          .where((c) => c['matchPercentage'] >= 70 && c['matchPercentage'] < 80)
          .toList();
    } else if (selectedFilter.value == '80-90% Match') {
      filteredCandidates.value = candidates
          .where((c) => c['matchPercentage'] >= 80 && c['matchPercentage'] < 90)
          .toList();
    } else if (selectedFilter.value == '90-95+') {
      filteredCandidates.value = candidates
          .where((c) => c['matchPercentage'] >= 90)
          .toList();
    }
  }

  void toggleSave() {
    isSaved.value = !isSaved.value;
  }

  void viewPost() {
    // Handle view post action
    Get.snackbar('View Post', 'Opening job post details...');
  }

  void rePost() {
    // Handle re-post action
    Get.snackbar('Re-Post', 'Re-posting job...');
  }

  void closePost() {
    // Handle close post action
    Get.snackbar('Close Post', 'Closing job post...');
  }

  void viewCandidateProfile(String candidateName) {
    // Handle candidate profile view
    Get.snackbar('Candidate Profile', 'Opening $candidateName profile...');
    Get.toNamed(
      RecruiterRoutes.resume,
      arguments: {'isShortlist': true, 'isInterview': true, 'isReject': true},
    );
  }
}
