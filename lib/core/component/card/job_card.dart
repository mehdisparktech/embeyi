import 'package:flutter/material.dart';
import 'package:embeyi/core/component/image/common_image.dart';
import 'package:embeyi/core/utils/extensions/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobCard extends StatefulWidget {
  final String companyName;
  final String location;
  final String jobTitle;
  final String salaryRange;
  final String? timePosted;
  final bool isFullTime;
  final String companyLogo;
  final String? totalapply;
  final bool isApplied;
  final bool isSaved;
  final bool isFavorite;
  final VoidCallback onTap;
  const JobCard({
    super.key,
    required this.companyName,
    required this.location,
    required this.jobTitle,
    required this.salaryRange,
    this.timePosted = '',
    required this.isFullTime,
    required this.companyLogo,
    this.totalapply = '',
    this.isApplied = false,
    this.isSaved = false,
    this.isFavorite = true,
    required this.onTap,
  });

  @override
  State<JobCard> createState() => JobCardState();
}

class JobCardState extends State<JobCard> {
  bool isFavorited =
      false; // Changed from false to widget.isSaved, but accessed using widget.isSaved
  @override
  void initState() {
    super.initState();
    isFavorited = widget.isSaved;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.r),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          shadows: [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 4,
              offset: Offset(0, 2),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row - Company info and favorite button
            Row(
              children: [
                // Company Logo
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: CommonImage(imageSrc: widget.companyLogo),
                ),
                10.width,
                // Company Name and Location
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.companyName,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      4.height,
                      Text(
                        widget.location,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                // Favorite Button
                if (widget.isFavorite)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorited = !isFavorited;
                      });
                    },
                    child: Icon(
                      isFavorited ? Icons.favorite : Icons.favorite_border,
                      color: isFavorited ? Colors.black : Colors.black,
                      size: 24,
                    ),
                  ),
              ],
            ),
            6.height,
            // Job Title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.jobTitle,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                if (widget.isFullTime)
                  Text(
                    'Full Time',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                if (!widget.isFullTime)
                  Text(
                    'Part Time',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ],
            ),
            6.height,
            // Bottom Row - Salary, Full Time, and Time Posted
            Row(
              children: [
                // Salary
                Text(
                  widget.salaryRange,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                // Time Posted
                Text(
                  widget.isApplied
                      ? widget.totalapply ?? ''
                      : widget.timePosted ?? '',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
