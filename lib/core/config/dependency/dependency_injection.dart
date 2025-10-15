import 'package:embeyi/core/config/dependency/job_seeker_dependency_injection.dart';
import 'package:embeyi/core/config/dependency/recruiter_dependency_injection.dart';
import 'package:get/get.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    JobSeekerDependencyInjection().dependencies();
    RecruiterDependencyInjection().dependencies();
  }
}
