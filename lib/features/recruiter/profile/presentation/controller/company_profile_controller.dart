import 'package:embeyi/core/utils/constants/app_icons.dart';
import 'package:embeyi/features/recruiter/profile/data/model/company_job_item_model.dart';
import 'package:get/get.dart';
import 'package:embeyi/core/utils/constants/app_images.dart';

class CompanyProfileController extends GetxController {
  // State management
  final RxInt selectedTabIndex = 0.obs;

  // Company data
  final String companyImage = AppImages.imageBackground;
  final String companyLogo = AppIcons.companyLogo;
  final String companyName = 'Design-Hill';
  final String tagline =
      'Marketing That Performs. Get Red And Act By A Google Partner & B Corp Agency.';

  final String overviewDescription =
      'Serious Marketing Is A Google Partner And A Corp Certified Agency Focused On One Thing: Delivering Results.\n\nOver The Past 10 Years, We\'ve Helped 250+ Clients Show Up Through High-Performing Websites, Social Content, And Paid Ads. From Local Governments To Scaling Startups, We Build Marketing Systems That Convert—And We\'re Not Your Typical Agency. We Don\'t Just "Make It Pretty." We Optimize For Revenue. Period.';

  final List<String> galleryImages = [
    AppImages.jobPost,
    AppImages.jobPost,
    AppImages.jobPost,
    AppImages.jobPost,
    AppImages.jobPost,
    AppImages.jobPost,
    AppImages.jobPost,
    AppImages.jobPost,
    AppImages.jobPost,
    AppImages.jobPost,
    AppImages.jobPost,
    AppImages.jobPost,
  ];

  final String aboutDescription =
      'We Are Google Partner And A Corp Certified Agency Focused On One Thing: Delivering Results.\n\nOver The Past 10 Years, We\'ve Helped 250+ Clients Show Up Through High-Performing Websites, Social Content, And Engaging Campaigns That Reduce Cart Abandonment And Helped Our Clients Sell Millions In Products And Services.\n\nAward-Winning Work That\'s Done 100% In An In-House Studio\nStrategic, Clean, Effective\nField Service Packages Built For Scale';

  final List<CompanyJobItem> companyJobs = [
    CompanyJobItem(
      title: 'Senior UI/UX Designer',
      companyName: 'Design-Hill',
      isFullTime: true,
      isRemote: true,
      candidateCount: 10,
      deadline: '2025-01-01',
      thumbnailImage: AppImages.jobPost,
      salary: '\$40,000 - \$80,000',
    ),
    CompanyJobItem(
      title: 'Frontend Developer',
      companyName: 'Design-Hill',
      salary: '\$50,000 - \$90,000',
      isFullTime: true,
      isRemote: true,
      candidateCount: 10,
      deadline: '2025-01-01',
      thumbnailImage: AppImages.jobPost,
    ),
    CompanyJobItem(
      title: 'Marketing Specialist',
      companyName: 'Design-Hill',
      salary: '\$35,000 - \$65,000',
      isFullTime: true,
      isRemote: true,
      candidateCount: 10,
      deadline: '2025-01-01',
      thumbnailImage: AppImages.jobPost,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  // Methods
  void onTabSelected(int index) {
    selectedTabIndex.value = index;
  }
}
