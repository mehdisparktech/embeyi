import 'package:embeyi/core/component/appbar/common_appbar.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/constants/app_images.dart';
import 'package:embeyi/core/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import '../widgets/company_overview_widgets.dart';

class CompanyOverviewScreen extends StatefulWidget {
  const CompanyOverviewScreen({super.key});

  @override
  State<CompanyOverviewScreen> createState() => _CompanyOverviewScreenState();
}

class _CompanyOverviewScreenState extends State<CompanyOverviewScreen> {
  int selectedTabIndex = 0;

  // Sample data - Replace with actual data from API or navigation parameters
  final String companyImage = AppImages.imageBackground;
  final String companyLogo = AppImages.companyLogo;
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
      location: '2IR Thermings Cir, Syracuse, Connecticut',
      salary: '\$40,000 - \$80,000',
    ),
    CompanyJobItem(
      title: 'Frontend Developer',
      location: 'Remote',
      salary: '\$50,000 - \$90,000',
    ),
    CompanyJobItem(
      title: 'Marketing Specialist',
      location: 'New York, NY',
      salary: '\$35,000 - \$65,000',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceBackground,
      appBar: CommonAppbar(title: 'Company Overview'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Header with Company Image and Logo
            CompanyHeroHeader(
              companyImage: companyImage,
              companyLogo: companyLogo,
            ),

            // Company Name and Tagline
            CompanyNameSection(companyName: companyName, tagline: tagline),

            20.height,

            // Tab Navigation
            CompanyTabNavigation(
              selectedIndex: selectedTabIndex,
              onTabSelected: (index) {
                setState(() {
                  selectedTabIndex = index;
                });
              },
            ),

            24.height,

            // Tab Content
            _buildTabContent(),

            24.height,
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (selectedTabIndex) {
      case 0: // Home Tab
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Overview Section
            const CompanySectionTitle(title: 'Overview'),
            12.height,
            CompanyOverviewContent(description: overviewDescription),
            24.height,

            // Gallery Section
            const CompanySectionTitle(title: 'Gallery'),
            12.height,
            CompanyGalleryGrid(images: galleryImages, crossAxisCount: 4),
          ],
        );

      case 1: // About Tab
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CompanySectionTitle(title: 'About Us'),
            12.height,
            CompanyAboutContent(aboutText: aboutDescription),
          ],
        );

      case 2: // Jobs Tab
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CompanySectionTitle(title: 'Open Positions'),
            12.height,
            CompanyJobsList(jobs: companyJobs),
          ],
        );

      default:
        return const SizedBox.shrink();
    }
  }
}
