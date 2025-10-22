import 'package:embeyi/core/component/pop_up/job_post_details_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:embeyi/core/utils/helpers/other_helper.dart';

class RecruiterCreateJobPostController extends GetxController {
  // Controllers
  final jobTitleController = TextEditingController();
  final minSalaryController = TextEditingController();
  final maxSalaryController = TextEditingController();
  final jobLocationController = TextEditingController();
  final companyDescriptionController = TextEditingController();
  final keyResponsibilitiesController = TextEditingController();
  final requirementsController = TextEditingController();
  final workingHoursController = TextEditingController();
  final howToApplyController = TextEditingController();
  final applicationDeadlineController = TextEditingController();

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
    showDialog(
      context: Get.context!,
      builder: (context) => const JobPostDetailsPopup(),
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
