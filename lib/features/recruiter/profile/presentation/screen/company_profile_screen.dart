import 'package:embeyi/core/component/appbar/common_appbar.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/company_profile_controller.dart';
import '../widgets/company_overview_widgets.dart';

class CompanyProfileScreen extends StatelessWidget {
  const CompanyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CompanyProfileController());

    return Scaffold(
      backgroundColor: AppColors.surfaceBackground,
      appBar: CommonAppbar(title: 'Company Overview'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Header with Company Image and Logo
            CompanyHeroHeader(
              companyImage: controller.companyImage,
              companyLogo: controller.companyLogo,
            ),

            // Company Name and Tagline
            CompanyNameSection(
              companyName: controller.companyName,
              tagline: controller.tagline,
            ),

            20.height,

            // Tab Navigation
            Obx(
              () => CompanyTabNavigation(
                selectedIndex: controller.selectedTabIndex.value,
                onTabSelected: controller.onTabSelected,
              ),
            ),

            24.height,

            // Tab Content
            Obx(() => _buildTabContent(controller)),

            24.height,
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(CompanyProfileController controller) {
    switch (controller.selectedTabIndex.value) {
      case 0: // Home Tab
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Overview Section
            const CompanySectionTitle(title: 'Overview'),
            12.height,
            CompanyOverviewContent(description: controller.overviewDescription),
            24.height,

            // Gallery Section
            const CompanySectionTitle(title: 'Gallery'),
            12.height,
            CompanyGalleryGrid(
              images: controller.galleryImages,
              crossAxisCount: 4,
            ),
          ],
        );

      case 1: // About Tab
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CompanySectionTitle(title: 'About Us'),
            12.height,
            CompanyAboutContent(aboutText: controller.aboutDescription),
          ],
        );

      case 2: // Jobs Tab
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CompanySectionTitle(title: 'Open Positions'),
            12.height,
            CompanyJobsList(jobs: controller.companyJobs),
          ],
        );

      default:
        return const SizedBox.shrink();
    }
  }
}
