import 'package:clinic_booking_app/core/widgets/doctors_sorting_widget.dart';
import 'package:clinic_booking_app/features/home/presentation/views/tabs/doctors_card_item.dart';
import 'package:flutter/material.dart';

class PediatricianTab extends StatelessWidget {
  const PediatricianTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          spacing: 8,
          children: [
            DoctorsSortingWidget(doctorsNumberFound: '450', onTap: () {}),
            ListView.builder(
              itemCount: 10,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => DoctorsCardItem(
                doctorImage:
                    "https://raw.githubusercontent.com/MohamedNassrr/doctor_booking_app/features/home/assets/photos/doctors/doctorm1.png",
                doctorName: 'Dr.David Patel',
                doctorSpecialist: 'Cardiologist',
                clinicName: 'Cardiology Center',
                onPressed: () {},
                rating: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
