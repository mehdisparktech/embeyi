import 'package:embeyi/core/component/image/common_image.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/constants/app_images.dart';
import 'package:embeyi/core/utils/extensions/extension.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Hero Banner Widget with Carousel
class HeroBanner extends StatefulWidget {
  final String bannerImage;
  final VoidCallback? onTap;

  const HeroBanner({super.key, required this.bannerImage, this.onTap});

  @override
  State<HeroBanner> createState() => _HeroBannerState();
}

class _HeroBannerState extends State<HeroBanner> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  // List of banner images for the carousel
  final List<String> _bannerImages = [
    AppImages.heroBanner,
    AppImages.heroBanner,
    AppImages
        .heroBanner, // Adding more for demo, you can replace with actual images
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: _carouselController,
          itemCount: _bannerImages.length,
          itemBuilder: (context, index, realIndex) {
            return GestureDetector(
              onTap: widget.onTap,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                height: 160.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: CommonImage(
                    imageSrc: _bannerImages[index],
                    fill: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 160.h,
            viewportFraction: 1,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 1500),
            autoPlayCurve: Curves.fastOutSlowIn,
            initialPage: _currentIndex,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        12.height,
        // Custom Dots Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _bannerImages.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () async {
                await _carouselController.animateToPage(entry.key);
              },
              child: Container(
                width: _currentIndex == entry.key ? 24.w : 8.w,
                height: 8.h,
                margin: EdgeInsets.symmetric(horizontal: 4.0.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: _currentIndex == entry.key
                      ? AppColors.primaryColor
                      : AppColors.primaryColor.withOpacity(0.3),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
