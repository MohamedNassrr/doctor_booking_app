import 'package:clinic_booking_app/core/widgets/custom_form_field.dart';
import 'package:clinic_booking_app/features/auth/presentation/controller/register_cubit/register_cubit.dart';
import 'package:clinic_booking_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterFormFields extends StatelessWidget {
  const RegisterFormFields({
    super.key,
    required this.userNameController,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController userNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    var registerCubit = context.watch<RegisterCubit>();
    return Column(
      spacing: 20,
      children: [
        CustomFormField(
          controller: userNameController,
          hintText: S.of(context).yourName,
          type: TextInputType.name,
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
          controller: passwordController,
          hintText: S.of(context).password,
          type: TextInputType.text,
          prefix: FontAwesomeIcons.lock,
          suffix: registerCubit.suffix,
          isPassword: registerCubit.isPassword,
          suffixPressed: () {
            registerCubit.changePasswordVisibility();
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
        ),
      ],
    );
  }
}
