import 'package:clinic_booking_app/core/widgets/custom_divider.dart';
import 'package:clinic_booking_app/core/widgets/custom_text_button.dart';
import 'package:clinic_booking_app/features/auth/presentation/controller/login_cubit/login_cubit.dart';
import 'package:clinic_booking_app/features/auth/presentation/controller/login_cubit/login_state.dart';
import 'package:clinic_booking_app/features/auth/presentation/views/widgets/advanced_auth.dart';
import 'package:clinic_booking_app/features/auth/presentation/views/widgets/forget_pass_signup_buttons.dart';
import 'package:clinic_booking_app/features/auth/presentation/views/widgets/login_form_fields.dart';
import 'package:clinic_booking_app/features/auth/presentation/views/widgets/welcoming_text.dart';
import 'package:clinic_booking_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      listener: (context, state) {},
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
                  const WelcomingText(),
                  LoginFormFields(
                    emailController: emailController,
                    passwordController: passwordController,
                    loginCubit: loginCubit,
                    formKey: formKey,
                  ),
                  const SizedBox(height: 23),
                  CustomTextButton(
                    title: S.of(context).signIn,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {}
                    },
                  ),
                  const SizedBox(height: 23),
                  const CustomDivider(),
                  const SizedBox(height: 23),
                  const AdvancedAuth(),
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
