import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:embeyi/core/utils/helpers/other_helper.dart';

class RecruiterEditJobPostController extends GetxController {
  // Controllers
  final jobTitleController = TextEditingController(text: 'UI-UX Designer');
  final minSalaryController = TextEditingController();
  final maxSalaryController = TextEditingController();
  final jobLocationController = TextEditingController(
    text: 'Netify Ave, Student Valley, Doulzing',
  );
  final companyDescriptionController = TextEditingController(
    text:
        'We Are Artemis Is A Leading Creative Design Studio Based In London. We Specialise In Creating Innovative And Impactful Designs For A Wide Range Of Clients, From Startups To Established Brands. Our Team Is Passionate About Design And Committed To Delivering Exceptional Results.',
  );
  final keyResponsibilitiesController = TextEditingController(
    text:
        'INCLUDES ROLES SUCH AS Product Manager, Business Analyst, UX/UI Designer, Software Developer/Engineer Etc. Design Highly Scalable, Testable Code. Discover And Fix Programming Bugs.',
  );
  final requirementsController = TextEditingController(
    text:
        'REQUIRES ADVANCED DEGREES IN Fields Like Medicine, Engineering, Or Applied Field. Strong Communication And Interpersonal Skills, Along With The Ability To Work Independently And As Part Of A Team.',
  );
  final workingHoursController = TextEditingController(
    text: 'Sat to Thu - 1:00 AM',
  );
  final howToApplyController = TextEditingController(
    text:
        'Email Your CV And Portfolio To Info@Icpm.Com OR Apply Through Our Website At Www.Icpm.Com',
  );
  final applicationDeadlineController = TextEditingController(
    text: '30-Oct-2025',
  );

  // Dropdown values
  final selectedJobCategory = 'Software Development'.obs;
  final selectedEmploymentType = 'Full Time'.obs;
  final selectedJobType = 'Remote'.obs;
  final selectedExperienceLevel = 'Entry Level'.obs;
  final selectedSSSRequired = 'LLMs'.obs;

  // Dropdown options
  final List<String> jobCategories = [
    'Software Development',
    'Design',
    'Marketing',
    'Sales',
  ];
  final List<String> employmentTypes = [
    'Full Time',
    'Part Time',
    'Contract',
    'Internship',
  ];
  final List<String> jobTypes = ['Remote', 'On-site', 'Hybrid'];
  final List<String> experienceLevels = [
    'Entry Level',
    'Mid Level',
    'Senior Level',
    'Executive',
  ];
  final List<String> sssRequiredOptions = [
    'LLMs',
    'Machine Learning',
    'Data Science',
    'AI',
  ];

  // Skills/Tags
  final RxList<String> skills = <String>[
    'Figma',
    'UI Design',
    'Website Design',
    'Recruiting',
  ].obs;

  // Profile image
  final Rx<String?> profileImagePath = Rx<String?>(null);

  // Methods
  void updateJobCategory(String value) {
    selectedJobCategory.value = value;
  }

  void updateEmploymentType(String value) {
    selectedEmploymentType.value = value;
  }

  void updateJobType(String value) {
    selectedJobType.value = value;
  }

  void updateExperienceLevel(String value) {
    selectedExperienceLevel.value = value;
  }

  void updateSSSRequired(String value) {
    selectedSSSRequired.value = value;
  }

  void removeSkill(String skill) {
    skills.remove(skill);
  }

  void addSkill(String skill) {
    if (skill.isNotEmpty && !skills.contains(skill)) {
      skills.add(skill);
    }
  }

  Future<void> pickProfileImage() async {
    final imagePath = await OtherHelper.openGalleryForProfile();
    if (imagePath != null) {
      profileImagePath.value = imagePath;
    }
  }

  Future<void> selectDeadlineDate() async {
    await OtherHelper.openDatePickerDialog(applicationDeadlineController);
  }

  void showAddSkillDialog() {
    final skillController = TextEditingController();
    Get.dialog(
      AlertDialog(
        title: const Text('Add Skill'),
        content: TextField(
          controller: skillController,
          decoration: const InputDecoration(hintText: 'Enter skill name'),
        ),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              addSkill(skillController.text);
              Get.back();
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void submitJobPost() {
    // Handle submit action
    // Add your API call or business logic here
    Get.snackbar(
      'Success',
      'Job post updated successfully',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  void onClose() {
    jobTitleController.dispose();
    minSalaryController.dispose();
    maxSalaryController.dispose();
    jobLocationController.dispose();
    companyDescriptionController.dispose();
    keyResponsibilitiesController.dispose();
    requirementsController.dispose();
    workingHoursController.dispose();
    howToApplyController.dispose();
    applicationDeadlineController.dispose();
    super.onClose();
  }
}
