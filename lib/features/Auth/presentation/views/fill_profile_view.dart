import 'package:clinic_booking_app/features/auth/presentation/views/widgets/fill_profile_body.dart';
import 'package:flutter/material.dart';

class FillProfileView extends StatelessWidget {
  const FillProfileView({
    super.key,
    required this.userName,
    required this.email,
    required this.password,
  });

  final String userName;
  final String email;
  final String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: SafeArea(
        child: FillProfileBody(
          userName: userName,
          email: email,
          password: password,
        ),
      ),
    );
  }
}
