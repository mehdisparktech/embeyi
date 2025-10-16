import 'package:embeyi/core/config/route/recruiter_routes.dart';
import 'package:get/get.dart';
import 'package:embeyi/core/utils/constants/app_images.dart';

class AllJobPostController extends GetxController {
  // Observable properties
  final RxInt selectedTabIndex = 0.obs; // 0 = Active, 1 = Closed
  final RxList<Map<String, dynamic>> activeJobs = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> closedJobs = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadJobs();
  }

  void _loadJobs() {
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

    closedJobs.value = [
      {
        'title': 'Senior Developer',
        'location': 'California, United State.',
        'isFullTime': true,
        'isRemote': true,
        'candidateCount': 300,
        'deadline': '01 Nov 25',
        'thumbnail': AppImages.jobPost,
      },
    ];
  }

  void selectTab(int index) {
    selectedTabIndex.value = index;
  }

  List<Map<String, dynamic>> get currentJobs {
    return selectedTabIndex.value == 0 ? activeJobs : closedJobs;
  }

  void createNewJobPost() {
    RecruiterRoutes.goToCreateJobPost();
  }

  void viewJobDetails(String jobTitle) {
    RecruiterRoutes.goToJobCardDetails();
  }

  void editJobPost(String jobTitle) {
    RecruiterRoutes.goToEditJobPost();
  }
}
