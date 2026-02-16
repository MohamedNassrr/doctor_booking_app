import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:clinic_booking_app/features/doctor_details/presentation/views/widgets/doctor_details_body.dart';
import 'package:clinic_booking_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          S.of(context).doctorDetails,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
            color: AppColors.mainColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.heart),
          ),
        ],
      ),
      body: const DoctorDetailsBody(),
    );
  }
}
