import 'package:clinic_booking_app/core/services/facebook_auth_service.dart';
import 'package:clinic_booking_app/core/services/google_auth_service.dart';
import 'package:clinic_booking_app/core/services/service_locator.dart';
import 'package:clinic_booking_app/core/utils/app_routing.dart';
import 'package:clinic_booking_app/core/utils/assets_data.dart';
import 'package:clinic_booking_app/core/widgets/custom_icon_text_butto.dart';
import 'package:clinic_booking_app/features/auth/presentation/controller/social_auth_cubit/social_auth_cubit.dart';
import 'package:clinic_booking_app/features/auth/presentation/controller/social_auth_cubit/social_auth_state.dart';
import 'package:clinic_booking_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SocialAuth extends StatelessWidget {
  const SocialAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialAuthCubit(
        getIt.get<GoogleService>(),
        getIt.get<FacebookAuthService>(),
      ),
      child: BlocConsumer<SocialAuthCubit, SocialAuthStates>(
        listener: (context, state) {
          if (state is GoogleSignInSuccessState ||
              state is FacebookSignInSuccessState) {
            GoRouter.of(context).pushReplacement(AppRouting.rHome);
          }
        },
        builder: (context, state) {
          var socialAuthCubit = context.read<SocialAuthCubit>();
          return Column(
            spacing: 16,
            children: [
              CustomIconTextButton(
                onPressed: () {
                  socialAuthCubit.googleSignIn();
                },
                buttonText: S.of(context).signInWithGoogle,
                image: AssetsData.googleIcon,
                imageHeight: 20,
                imageWidth: 20,
              ),
              CustomIconTextButton(
                onPressed: () {
                  socialAuthCubit.facebookSignIn();
                },
                buttonText: S.of(context).signInWithFacebook,
                image: AssetsData.facebookIcon,
                imageHeight: 20,
                imageWidth: 20,
              ),
            ],
          );
        },
      ),
    );
  }
}
