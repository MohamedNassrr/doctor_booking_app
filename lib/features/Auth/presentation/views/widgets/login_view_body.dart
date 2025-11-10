import 'package:clinic_booking_app/core/utils/app_routing.dart';
import 'package:clinic_booking_app/core/widgets/custom_divider.dart';
import 'package:clinic_booking_app/core/widgets/custom_text_button.dart';
import 'package:clinic_booking_app/features/auth/presentation/controller/login_cubit/login_cubit.dart';
import 'package:clinic_booking_app/features/auth/presentation/controller/login_cubit/login_state.dart';
import 'package:clinic_booking_app/features/auth/presentation/views/widgets/forget_pass_signup_buttons.dart';
import 'package:clinic_booking_app/features/auth/presentation/views/widgets/login_form_fields.dart';
import 'package:clinic_booking_app/features/auth/presentation/views/widgets/social_auth.dart';
import 'package:clinic_booking_app/features/auth/presentation/views/widgets/welcoming_text.dart';
import 'package:clinic_booking_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          GoRouter.of(context).pushReplacement(AppRouting.rHome);
        }
        if (state is LoginFailureState) {
          final l10n = S.of(context);
          String message;

          switch (state.failure) {
            case 'user-not-found':
              message = l10n.error_user_not_found;
              break;
            case 'wrong-password':
              message = l10n.error_wrong_password;
              break;
            case 'account-exists-with-different-credential':
              message = l10n.error_account_exists;
              break;
            case 'network-request-failed':
              message = l10n.error_network_failed;
              break;
            default:
              message = l10n.error_generic;
          }

          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(message)));
        }
      },
      builder: (context, state) {
        var loginCubit = context.read<LoginCubit>();
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WelcomingText(
                    welcomingText: S.of(context).hiWelcomeBack,
                    welcomingDescription: S.of(context).hopeYouAreDoingFine,
                  ),
                  LoginFormFields(
                    emailController: emailController,
                    passwordController: passwordController,
                    formKey: formKey,
                  ),
                  const SizedBox(height: 23),
                  CustomTextButton(
                    isLoading: state is LoginLoadingState,
                    title: S.of(context).signIn,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        loginCubit.userLogin(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 23),
                  const CustomDivider(),
                  const SizedBox(height: 23),
                  const SocialAuth(),
                  const ForgetPassAndSingUpButtons(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
