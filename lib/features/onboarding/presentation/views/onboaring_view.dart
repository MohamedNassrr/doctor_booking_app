import 'package:clinic_booking_app/features/onboarding/presentation/views/widgets/oboarding_view_body.dart';
import 'package:flutter/material.dart';

class OnboaringView extends StatelessWidget {
  const OnboaringView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: OboardingViewBody()),
    );
  }
}