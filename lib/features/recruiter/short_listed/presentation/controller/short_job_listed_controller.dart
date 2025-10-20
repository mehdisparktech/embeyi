import 'package:embeyi/core/config/route/recruiter_routes.dart';
import 'package:get/get.dart';
import 'package:embeyi/core/utils/constants/app_images.dart';

class ShortJobListedController extends GetxController {
  // Observable list for shortlisted candidates
  final RxList<Map<String, dynamic>> shortlistedCandidates =
      <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadShortlistedCandidates();
  }

  void _loadShortlistedCandidates() {
    shortlistedCandidates.value = [
      {
        'name': 'Kathryn Murphy',
        'jobTitle': 'Sr. UI/UX Designer',
        'experience': '5 Years Experience',
        'description':
            'A Dedicated And Reliable Professional With Strong Teamwork And Problem Solving Skills, Committed To Delivering Quality Results On Time',
        'profileImage': AppImages.profile,
      },
      {
        'name': 'Esther Howard',
        'jobTitle': 'Sr. UI/UX Designer',
        'experience': '5 Years Experience',
        'description':
            'A Dedicated And Reliable Professional With Strong Teamwork And Problem Solving Skills, Committed To Delivering Quality Results On Time',
        'profileImage': AppImages.profile,
      },
      {
        'name': 'Jane Cooper',
        'jobTitle': 'Sr. UI/UX Designer',
        'experience': '5 Years Experience',
        'description':
            'A Dedicated And Reliable Professional With Strong Teamwork And Problem Solving Skills, Committed To Delivering Quality Results On Time',
        'profileImage': AppImages.profile,
      },
      {
        'name': 'Theresa Webb',
        'jobTitle': 'Sr. UI/UX Designer',
        'experience': '5 Years Experience',
        'description':
            'A Dedicated And Reliable Professional With Strong Teamwork And Problem Solving Skills, Committed To Delivering Quality Results On Time',
        'profileImage': AppImages.profile,
      },
    ];
  }

  void deleteCandidate(int index) {
    final candidateName = shortlistedCandidates[index]['name'];
    shortlistedCandidates.removeAt(index);
    Get.snackbar(
      'Removed',
      '$candidateName has been removed from shortlist',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void viewCandidateProfile(String candidateName) {
    // Handle candidate profile view
    Get.snackbar('Candidate Profile', 'Opening $candidateName profile...');
    Get.toNamed(
      RecruiterRoutes.resume,
      arguments: {'isShortlist': false, 'isInterview': true, 'isReject': true},
    );
  }
}
