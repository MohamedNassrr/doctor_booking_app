import 'package:carousel_slider/carousel_slider.dart';
import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:clinic_booking_app/features/home/presentation/controller/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var carouselCubit = context.watch<HomeCubit>();
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: carouselCubit.banners.length,
          itemBuilder: (context, index, realIndex) {
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(carouselCubit.banners[index]),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            );
          },
          options: CarouselOptions(
            enableInfiniteScroll: true,
            viewportFraction: 1,
            autoPlay: true,
            onPageChanged: (index, reason) => carouselCubit.changeBanner(index),
            autoPlayInterval: const Duration(seconds: 19),
            autoPlayAnimationDuration: const Duration(seconds: 4),
            autoPlayCurve: Curves.easeInOut,
            scrollDirection: Axis.horizontal,
            height: MediaQuery.of(context).size.height / 5,
          ),
        ),
        Positioned(
          bottom: 6,
          left: 127,
          child: AnimatedSmoothIndicator(
            activeIndex: carouselCubit.currentBanner,
            count: carouselCubit.banners.length,
            effect: const ExpandingDotsEffect(
              activeDotColor: Colors.white,
              dotWidth: 12,
              dotHeight: 6,
              dotColor: AppColors.grey400,
              spacing: 4,
              radius: 40,
            ),
          ),
        ),
      ],
    );
  }
}
