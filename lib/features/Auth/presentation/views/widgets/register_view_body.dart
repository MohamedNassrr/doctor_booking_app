import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:clinic_booking_app/core/utils/app_routing.dart';
import 'package:clinic_booking_app/core/widgets/custom_divider.dart';
import 'package:clinic_booking_app/core/widgets/custom_form_field.dart';
import 'package:clinic_booking_app/core/widgets/custom_text_button.dart';
import 'package:clinic_booking_app/features/auth/presentation/views/widgets/social_auth.dart';
import 'package:clinic_booking_app/features/auth/presentation/views/widgets/welcoming_text.dart';
import 'package:clinic_booking_app/generated/l10n.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        children: [
          WelcomingText(
            welcomingText: S.of(context).createAccount,
            welcomingDescription: S.of(context).weAreHereToHelpYou,
          ),
          Column(
            spacing: 20,
            children: [
              CustomFormField(
                controller: userNameController,
                hintText: S.of(context).yourEmail,
                type: TextInputType.text,
                prefix: FontAwesomeIcons.user,
                validation: (value) {
                  if (value!.isEmpty) {
                    return S.of(context).usernameValidation;
                  }
                  return null;
                },
              ),
              CustomFormField(
                controller: emailController,
                hintText: S.of(context).yourEmail,
                type: TextInputType.emailAddress,
                prefix: FontAwesomeIcons.envelope,
                validation: (value) {
                  if (value!.isEmpty) {
                    return S.of(context).emailCantBeEmpty;
                  }
                  if (!value.contains('@') ||
                      !value.contains('.com') ||
                      !value.contains('.')) {
                    return S.of(context).pleaseEnterValidEmail;
                  }
                  return null;
                },
              ),
              CustomFormField(
                controller: emailController,
                hintText: S.of(context).password,
                type: TextInputType.text,
                prefix: FontAwesomeIcons.lock,
                suffixPressed: () {},
                validation: (value) {
                  if (value!.isEmpty) {
                    return S.of(context).passwordCantBeEmpty;
                  }
                  if (value.length < 6) {
                    return S.of(context).passwordTooShort;
                  }
                  return null;
                },
                onSubmit: (_) {},
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomTextButton(
            title: S.of(context).createAccount,
            onPressed: () {},
          ),
          const SizedBox(height: 20),
          const CustomDivider(),
          const SizedBox(height: 20),
          const SocialAuth(),
          const SizedBox(height: 20),
          Text.rich(
            TextSpan(
              text: S.of(context).doYouHaveAnAccount,
              style: Theme.of(
                context,
              ).textTheme.labelSmall!.copyWith(color: AppColors.grey500),
              children: [
                TextSpan(
                  text: S.of(context).signIn,
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge!.copyWith(color: AppColors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      GoRouter.of(context).pushReplacement(AppRouting.rLogin);
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
