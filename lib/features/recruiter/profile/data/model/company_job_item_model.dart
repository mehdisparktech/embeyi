// Model class for company jobs
class CompanyJobItem {
  final String title;
  final String companyName;
  final bool isFullTime;
  final bool isRemote;
  final int candidateCount;
  final String deadline;
  final String thumbnailImage;
  final String salary;

  CompanyJobItem({
    required this.title,
    required this.companyName,
    required this.isFullTime,
    required this.isRemote,
    required this.candidateCount,
    required this.deadline,
    required this.thumbnailImage,
    required this.salary,
  });
}
