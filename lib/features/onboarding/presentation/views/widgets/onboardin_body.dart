import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:clinic_booking_app/features/onboarding/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key, required this.item, required this.index});

  final List<OnboardingModel> item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 10,
      children: [
        Flexible(child: Image(image: AssetImage(item[index].imageUrl))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            spacing: 8,
            children: [
              Text(
                item[index].title,
                style: Theme.of(
                  context,
                ).textTheme.displayMedium!.copyWith(color: AppColors.grey700),
              ),
              Text(
                item[index].description,
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.labelSmall!.copyWith(color: AppColors.grey500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
