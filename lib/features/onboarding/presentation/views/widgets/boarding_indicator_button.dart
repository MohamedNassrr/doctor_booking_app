import 'package:clinic_booking_app/constance.dart';
import 'package:clinic_booking_app/core/services/local_storage.dart';
import 'package:clinic_booking_app/core/utils/app_routing.dart';
import 'package:clinic_booking_app/core/widgets/custom_text_button.dart';
import 'package:clinic_booking_app/features/onboarding/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingIndicatorButton extends StatefulWidget {
  const BoardingIndicatorButton({
    super.key,
    required this.onBoardingController,
    required this.onBoardingItems,
    required this.isLast,
  });

  final PageController onBoardingController;
  final List<OnboardingModel> onBoardingItems;
  final bool isLast;

  @override
  State<BoardingIndicatorButton> createState() =>
      _BoardingIndicatorButtonState();
}

class _BoardingIndicatorButtonState extends State<BoardingIndicatorButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        spacing: 20,
        children: [
          SmoothPageIndicator(
            controller: widget.onBoardingController,
            count: widget.onBoardingItems.length,
            effect: const ExpandingDotsEffect(
              activeDotColor: primaryColor,
              dotColor: Colors.grey,
              dotWidth: 10,
              dotHeight: 10,
              spacing: 5.5,
            ),
          ),
          CustomTextButton(
            title: widget.isLast ? 'Get Started' : 'Next',
            onPressed: () {
              if (widget.isLast) {
                LocalStorage.setData(key: 'onBoarding', value: true);
                GoRouter.of(context).pushReplacement(AppRouting.rLogin);
              } else {
                setState(() {
                  widget.onBoardingController.nextPage(
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeInOut,
                  );
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
