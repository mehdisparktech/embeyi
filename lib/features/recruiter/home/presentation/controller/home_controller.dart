import 'package:get/get.dart';
import 'package:embeyi/core/utils/constants/app_images.dart';

class RecruiterHomeController extends GetxController {
  // Observable list for recent jobs
  final RxList<Map<String, dynamic>> recentJobs = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadMockData();
  }

  void _loadMockData() {
    recentJobs.value = [
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
    ];
  }
}
