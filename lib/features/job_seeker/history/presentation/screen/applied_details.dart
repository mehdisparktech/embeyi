import 'package:embeyi/core/component/appbar/common_appbar.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/history_widgets.dart';

class AppliedDetails extends StatelessWidget {
  const AppliedDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppbar(
        title: 'Application Details',
        centerTitle: false,
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Application Header Card
              const ApplicationDetailsHeaderCard(
                hiringStatus: 'We are Hiring',
                jobTitle: 'Sr. UI/UX Designer',
                companyName: 'Design-Hill',
                location: 'California, United State.',
                status: 'Applied',
              ),

              24.height,

              // Application Timeline Section
              const DetailsSectionHeader(title: 'Application Timeline'),

              16.height,

              _buildTimeline(),

              24.height,

              // Attachment Section
              const DetailsSectionHeader(title: 'Attachment'),

              16.height,

              _buildAttachments(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeline() {
    return Column(
      children: [
        const TimelineItem(
          title: 'Applied',
          subtitle: '01 Sep 2025',
          isCompleted: true,
        ),
        const TimelineItem(
          title: 'Short Listed',
          subtitle: 'Pending',
          isCompleted: false,
        ),
        const TimelineItem(
          title: 'Interview',
          subtitle: 'Pending',
          isCompleted: false,
          isLast: true,
        ),
      ],
    );
  }

  Widget _buildAttachments() {
    return Column(
      children: [
        AttachmentCard(
          fileName: 'Resume made axpersy 20_89_4',
          fileType: 'PDF Document',
          fileSize: '103kb',
          onTap: () {
            // Handle file open
          },
        ),
        AttachmentCard(
          fileName: 'Experience Certificate',
          fileType: 'PDF Document',
          fileSize: '103kb',
          onTap: () {
            // Handle file open
          },
        ),
      ],
    );
  }
}
