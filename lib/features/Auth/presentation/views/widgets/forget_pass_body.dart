import 'package:clinic_booking_app/core/widgets/custom_form_field.dart';
import 'package:clinic_booking_app/core/widgets/custom_text_button.dart';
import 'package:clinic_booking_app/features/auth/presentation/controller/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:clinic_booking_app/features/auth/presentation/controller/forget_pass_cubit/forget_pass_state.dart';
import 'package:clinic_booking_app/features/auth/presentation/views/widgets/forget_pass_logo_text.dart';
import 'package:clinic_booking_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ForgetPassBody extends StatefulWidget {
  const ForgetPassBody({super.key});

  @override
  State<ForgetPassBody> createState() => _ForgetPassBodyState();
}

class _ForgetPassBodyState extends State<ForgetPassBody> {
  final TextEditingController emailController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPassCubit, ForgetPassStates>(
      listener: (context, state) {
        if (state is ForgetPassSuccessStates) {
          GoRouter.of(context).pop();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(S.of(context).resetCodeSent)));
        }
      },
      builder: (context, state) {
        var forgetPassCubit = context.read<ForgetPassCubit>();
        return Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 32,
              children: [
                const ForgetPassLogoText(),
                CustomFormField(
                  controller: emailController,
                  prefix: FontAwesomeIcons.envelope,
                  hintText: S.of(context).yourEmail,
                  type: TextInputType.emailAddress,
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
                  onSubmit: (_) {
                    if (formKey.currentState!.validate()) {
                      forgetPassCubit.sendResetCode(
                        email: emailController.text,
                      );
                    }
                  },
                ),
                CustomTextButton(
                  isLoading: State is ForgetPassLoadingStates,
                  title: S.of(context).sendCode,
                  onPressed: () {
                    forgetPassCubit.sendResetCode(email: emailController.text);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
