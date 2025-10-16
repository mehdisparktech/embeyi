import 'package:get/get.dart';
import 'package:embeyi/core/utils/constants/app_images.dart';

class InterviewJobController extends GetxController {
  // Observable properties
  final RxInt selectedTabIndex = 0.obs;
  final RxInt selectedDateIndex = 3.obs; // Tuesday (23) is selected by default
  final RxString selectedMonth = 'September 2025'.obs;
  
  final RxList<Map<String, dynamic>> upcomingInterviews = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> completedInterviews = <Map<String, dynamic>>[].obs;
  
  // Date list for the week
  final List<Map<String, dynamic>> dates = [
    {'day': 'Sat', 'date': '20'},
    {'day': 'Sun', 'date': '21'},
    {'day': 'Mon', 'date': '22'},
    {'day': 'Tue', 'date': '23'},
    {'day': 'Wed', 'date': '24'},
    {'day': 'Thu', 'date': '25'},
    {'day': 'Fri', 'date': '26'},
  ];

  @override
  void onInit() {
    super.onInit();
    _loadInterviews();
  }

  void _loadInterviews() {
    upcomingInterviews.value = [
      {
        'name': 'Cameron Williamson',
        'jobTitle': 'Sr. UI/UX Designer',
        'experience': '5 Years Experience',
        'scheduleTime': 'Schedule: 01 Oct 2025 At 09 Am',
        'profileImage': AppImages.profile,
      },
      {
        'name': 'Marvin McKinney',
        'jobTitle': 'Sr. UI/UX Designer',
        'experience': '5 Years Experience',
        'scheduleTime': 'Schedule: 01 Oct 2025 At 11 Am',
        'profileImage': AppImages.profile,
      },
      {
        'name': 'Theresa Webb',
        'jobTitle': 'Sr. UI/UX Designer',
        'experience': '5 Years Experience',
        'scheduleTime': 'Schedule: 01 Oct 2025 At 02 Pm',
        'profileImage': AppImages.profile,
      },
      {
        'name': 'Arlene McCoy',
        'jobTitle': 'Sr. UI/UX Designer',
        'experience': '5 Years Experience',
        'scheduleTime': 'Schedule: 01 Oct 2025 At 03 Pm',
        'profileImage': AppImages.profile,
      },
    ];

    completedInterviews.value = [
      {
        'name': 'Devon Lane',
        'jobTitle': 'Sr. UI/UX Designer',
        'experience': '5 Years Experience',
        'scheduleTime': 'Completed: 25 Sep 2025 At 10 Am',
        'profileImage': AppImages.profile,
      },
      {
        'name': 'Jerome Bell',
        'jobTitle': 'Sr. UI/UX Designer',
        'experience': '5 Years Experience',
        'scheduleTime': 'Completed: 24 Sep 2025 At 02 Pm',
        'profileImage': AppImages.profile,
      },
    ];
  }

  void selectTab(int index) {
    selectedTabIndex.value = index;
  }

  void selectDate(int index) {
    selectedDateIndex.value = index;
  }

  List<Map<String, dynamic>> get currentInterviews {
    return selectedTabIndex.value == 0 ? upcomingInterviews : completedInterviews;
  }

  void editInterview(String candidateName) {
    Get.snackbar('Edit Interview', 'Editing interview for $candidateName...');
  }

  void viewCandidateProfile(String candidateName) {
    Get.snackbar('Candidate Profile', 'Opening $candidateName profile...');
  }
}
