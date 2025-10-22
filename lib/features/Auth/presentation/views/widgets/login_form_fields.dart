import 'package:clinic_booking_app/core/widgets/custom_form_field.dart';
import 'package:clinic_booking_app/features/auth/presentation/controller/login_cubit/login_cubit.dart';
import 'package:clinic_booking_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginFormFields extends StatelessWidget {
  const LoginFormFields({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.loginCubit,
    required this.formKey,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final LoginCubit loginCubit;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
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
          controller: passwordController,
          hintText: S.of(context).password,
          type: TextInputType.text,
          prefix: FontAwesomeIcons.lock,
          suffix: loginCubit.suffix,
          isPassword: loginCubit.isPassword,
          suffixPressed: () {
            loginCubit.changePasswordVisibility();
          },
          validation: (value) {
            if (value!.isEmpty) {
              return S.of(context).passwordCantBeEmpty;
            }
            if (value.length < 6) {
              return S.of(context).passwordTooShort;
            }
            return null;
          },
          onSubmit: (_) {
            if (formKey.currentState!.validate()) {
              loginCubit.userLogin(
                email: emailController.text,
                password: passwordController.text,
              );
            }
          },
        ),
      ],
    );
  }
}
