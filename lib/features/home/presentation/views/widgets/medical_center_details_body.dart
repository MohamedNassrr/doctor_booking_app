import 'package:clinic_booking_app/features/home/presentation/views/widgets/clinics_doctor_item.dart';
import 'package:flutter/material.dart';

class MedicalCenterDetailsBody extends StatelessWidget {
  const MedicalCenterDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const ClinicsDoctorItem(
          image: " ",
          doctorName: "clinicname",
          doctorSpecialist: "doctorSpecialist",
          rating: 4,
        );
      },
    );
  }
}
