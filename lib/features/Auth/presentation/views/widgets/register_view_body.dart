import 'package:clinic_booking_app/core/utils/app_routing.dart';
import 'package:clinic_booking_app/core/widgets/custom_divider.dart';
import 'package:clinic_booking_app/core/widgets/custom_text_button.dart';
import 'package:clinic_booking_app/core/widgets/redirect_auth_row.dart';
import 'package:clinic_booking_app/features/auth/presentation/controller/user_cubit/user_state.dart';
import 'package:clinic_booking_app/features/auth/presentation/views/widgets/register_form_fields.dart';
import 'package:clinic_booking_app/features/auth/presentation/views/widgets/social_auth.dart';
import 'package:clinic_booking_app/features/auth/presentation/views/widgets/welcoming_text.dart';
import 'package:clinic_booking_app/generated/l10n.dart';
import 'package:flutter/material.dart';
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
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              WelcomingText(
                welcomingText: S.of(context).createAccount,
                welcomingDescription: S.of(context).weAreHereToHelpYou,
              ),
              RegisterFormFields(
                userNameController: userNameController,
                emailController: emailController,
                passwordController: passwordController,
              ),
              const SizedBox(height: 23),
              CustomTextButton(
                isLoading: State is UserGetDataLoadingStates,
                title: S.of(context).createAccount,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    GoRouter.of(context).push(
                      AppRouting.rFillProfile,
                      extra: {
                        'name': userNameController.text,
                        'email': emailController.text,
                        'password': passwordController.text,
                      },
                    );
                  }
                },
              ),
              const SizedBox(height: 23),
              const CustomDivider(),
              const SizedBox(height: 23),
              const SocialAuth(),
              const SizedBox(height: 23),
              RedirectAuthRow(
                textRow: S.of(context).doYouHaveAnAccount,
                authText: S.of(context).signIn,
                onTap: () {
                  GoRouter.of(context).pushReplacement(AppRouting.rLogin);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
