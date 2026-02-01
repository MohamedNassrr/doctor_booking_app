import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:clinic_booking_app/features/home/presentation/views/widgets/medical_center_details_body.dart';
import 'package:clinic_booking_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class MedicalCenterDetailsView extends StatelessWidget {
  const MedicalCenterDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          S.of(context).Doctors,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.mainColor,
          ),
        ),
      ),
      body: const  MedicalCenterDetailsBody(),
    );
  }
}
