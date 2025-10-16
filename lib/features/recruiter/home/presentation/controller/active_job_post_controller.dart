import 'package:get/get.dart';
import 'package:embeyi/core/utils/constants/app_images.dart';

class ActiveJobPostController extends GetxController {
  // Observable list for active jobs
  final RxList<Map<String, dynamic>> activeJobs = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadActiveJobs();
  }

  void _loadActiveJobs() {
    activeJobs.value = [
      {
        'title': 'Sr. UI/UX Designer',
        'location': 'California, United State.',
        'isFullTime': true,
        'isRemote': true,
        'candidateCount': 150,
        'deadline': '01 Dec 25',
        'thumbnail': AppImages.jobPost,
      },
      {
        'title': 'Web Designer',
        'location': 'California, United State.',
        'isFullTime': true,
        'isRemote': true,
        'candidateCount': 200,
        'deadline': '01 Dec 25',
        'thumbnail': AppImages.jobPost,
      },
      {
        'title': 'Office Assistance',
        'location': 'California, United State.',
        'isFullTime': true,
        'isRemote': true,
        'candidateCount': 200,
        'deadline': '01 Dec 25',
        'thumbnail': AppImages.jobPost,
      },
      {
        'title': 'Marketing Manager',
        'location': 'California, United State.',
        'isFullTime': true,
        'isRemote': true,
        'candidateCount': 200,
        'deadline': '01 Dec 25',
        'thumbnail': AppImages.jobPost,
      },
      {
        'title': 'IT Executive',
        'location': 'California, United State.',
        'isFullTime': true,
        'isRemote': true,
        'candidateCount': 200,
        'deadline': '01 Dec 25',
        'thumbnail': AppImages.jobPost,
      },
    ];
  }

  void createNewJobPost() {
    // Handle create new job post action
    Get.snackbar('Create Job', 'Opening job creation form...');
  }

  void viewJobDetails(String jobTitle) {
    // Handle job details view
    Get.snackbar('Job Details', 'Opening $jobTitle details...');
  }
}
