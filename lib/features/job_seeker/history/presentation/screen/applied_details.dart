import 'package:embeyi/core/component/appbar/common_appbar.dart';
import 'package:embeyi/core/component/text/common_text.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/history_widgets.dart';

class AppliedDetails extends StatelessWidget {
  final bool isRejected;
  final String status;
  const AppliedDetails({
    super.key,
    this.isRejected = false,
    required this.status,
  });

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
              ApplicationDetailsHeaderCard(
                hiringStatus: 'We are Hiring',
                jobTitle: 'Sr. UI/UX Designer',
                companyName: 'Design-Hill',
                location: 'California, United State.',
                status: status,
              ),

              24.height,

              Container(
                padding: const EdgeInsets.all(10),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Application Timeline Section
                    DetailsSectionHeader(title: 'Application Timeline'),

                    20.height,

                    _buildTimeline(),
                  ],
                ),
              ),
              24.height,
              // Attachment Section
              Container(
                padding: const EdgeInsets.all(10),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DetailsSectionHeader(title: 'Attachment'),
                    20.height,
                    _buildAttachments(),
                  ],
                ),
              ),
              24.height,
              if (isRejected)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: 'Rejection Reason',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.red,
                    ),
                    8.height,
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFEEEEE) /* Cart-BG-6 */,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            color: const Color(0xFFFF5900) /* Error */,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: CommonText(
                        text:
                            '''Thank you for applying for the UI/UX Designer position. After reviewing your CV and experience, we found that your qualifications do not fully match the specific requirements outlined for this role. The position requires proven expertise in areas such as user interface design, user experience research, wireframing, prototyping, and familiarity with industry-standard design tools (e.g., Figma, Adobe XD, Sketch).While your background demonstrates potential, we are seeking candidates with more direct experience in UI/UX design projects and a stronger portfolio showcasing relevant work. Unfortunately, based on these factors, we are unable to move forward with your application at this time.We encourage you to continue building your design experience and apply again in the future when your profile better aligns with the role’s requirements.''',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                        maxLines: 100,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
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
