import 'package:clinic_booking_app/features/onboarding/data/models/onboarding_model.dart';
import 'package:clinic_booking_app/features/onboarding/presentation/views/widgets/boarding_indicator_button.dart';
import 'package:clinic_booking_app/features/onboarding/presentation/views/widgets/onboardin_body.dart';
import 'package:clinic_booking_app/features/onboarding/presentation/views/widgets/skip_button.dart';
import 'package:flutter/material.dart';

class OboardingViewBody extends StatefulWidget {
  const OboardingViewBody({super.key});

  @override
  State<OboardingViewBody> createState() => _OboardingViewBodyState();
}

class _OboardingViewBodyState extends State<OboardingViewBody> {
  final PageController onBoardingController = PageController();
  final item = OnboardingModel.onBoardingItems;

  @override
  void dispose() {
    onBoardingController.dispose();
    super.dispose();
  }

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: PageView.builder(
            controller: onBoardingController,
            scrollDirection: Axis.horizontal,
            itemCount: item.length,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (int index) {
              if (index == item.length - 1) {
                setState(() {
                  isLast = true;
                });
              } else {
                setState(() {
                  isLast = false;
                });
              }
            },
            itemBuilder: (context, index) =>
                OnBoardingBody(item: item, index: index),
          ),
        ),
        BoardingIndicatorButton(
          onBoardingController: onBoardingController,
          onBoardingItems: item,
          isLast: isLast,
        ),
        const SkipButton(),
      ],
    );
  }
}
