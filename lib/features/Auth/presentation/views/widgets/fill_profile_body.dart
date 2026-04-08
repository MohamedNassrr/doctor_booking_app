import 'package:clinic_booking_app/core/utils/app_routing.dart';
import 'package:clinic_booking_app/core/widgets/custom_form_field.dart';
import 'package:clinic_booking_app/core/widgets/custom_text_button.dart';
import 'package:clinic_booking_app/core/widgets/custom_text_field.dart';
import 'package:clinic_booking_app/features/Auth/presentation/views/widgets/loading_screen.dart';
import 'package:clinic_booking_app/features/auth/presentation/controller/register_cubit/register_cubit.dart';
import 'package:clinic_booking_app/features/auth/presentation/controller/register_cubit/register_state.dart';
import 'package:clinic_booking_app/features/auth/presentation/views/widgets/profile_widget.dart';
import 'package:clinic_booking_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class FillProfileBody extends StatefulWidget {
  const FillProfileBody({
    super.key,
    required this.userName,
    required this.email,
    required this.password,
  });

  final String userName;
  final String email;
  final String password;

  @override
  State<FillProfileBody> createState() => _FillProfileBodyState();
}

class _FillProfileBodyState extends State<FillProfileBody> {
  final TextEditingController dateController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is CreateUserRegisterSuccessStates) {
          GoRouter.of(context).pushReplacement(AppRouting.rHome);
        }
      },
      builder: (context, state) {
        var registerCubit = context.read<RegisterCubit>();
        return Form(
          key: formKey,
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  child: Column(
                    spacing: 24,
                    children: [
                      const ProfileWidget(),
                      Column(
                        spacing: 20,
                        children: [
                          CustomTextField(
                            hintText: widget.userName,
                            type: TextInputType.text,
                            isEnabled: false,
                          ),
                          CustomTextField(
                            hintText: widget.email,
                            type: TextInputType.text,
                            isEnabled: false,
                          ),
                          CustomFormField(
                            controller: dateController,
                            hintText: S.of(context).dateOfBirth,
                            type: TextInputType.datetime,
                            prefix: FontAwesomeIcons.solidCalendarDays,
                            validation: (value) {
                              if (value!.isEmpty) {
                                return S.of(context).chooseBirthDate;
                              }
                              return null;
                            },
                            onTap: () {
                              showDatePicker(
                                context: context,
                                firstDate: DateTime(1900),
                                initialDate: DateTime.now().subtract(
                                  const Duration(days: 365 * 18),
                                ),
                                lastDate: DateTime.now(),
                              ).then((value) {
                                if (value != null) {
                                  dateController.text = DateFormat.yMMMd()
                                      .format(value);
                                }
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      CustomTextButton(
                        title: S.of(context).save,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            registerCubit.userRegister(
                              email: widget.email,
                              userName: widget.userName,
                              birthDate: dateController.text,
                              password: widget.password,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              if (state is RegisterLoadingStates) const LoadingScreen(),
            ],
          ),
        );
      },
    );
  }
}
