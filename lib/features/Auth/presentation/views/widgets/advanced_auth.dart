import 'package:clinic_booking_app/core/utils/assets_data.dart';
import 'package:clinic_booking_app/core/widgets/custom_icon_text_butto.dart';
import 'package:clinic_booking_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class AdvancedAuth extends StatelessWidget {
  const AdvancedAuth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        CustomIconTextButton(
          onPressed: () {},
          buttonText: S.of(context).signInWithGoogle,
          image: AssetsData.googleIcon,
          imageHeight: 20,
          imageWidth: 20,
        ),
        CustomIconTextButton(
          onPressed: () {},
          buttonText: S.of(context).signInWithFacebook,
          image: AssetsData.facebookIcon,
          imageHeight: 20,
          imageWidth: 20,
        ),
      ],
    );
  }
}

