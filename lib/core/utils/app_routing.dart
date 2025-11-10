import 'package:clinic_booking_app/core/services/local_storage.dart';
import 'package:clinic_booking_app/core/services/service_locator.dart';
import 'package:clinic_booking_app/features/Auth/presentation/views/login_view.dart';
import 'package:clinic_booking_app/features/auth/presentation/controller/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:clinic_booking_app/features/auth/presentation/controller/login_cubit/login_cubit.dart';
import 'package:clinic_booking_app/features/auth/presentation/controller/register_cubit/register_cubit.dart';
import 'package:clinic_booking_app/features/auth/presentation/controller/user_cubit/user_cubit.dart';
import 'package:clinic_booking_app/features/auth/presentation/views/fill_profile_view.dart';
import 'package:clinic_booking_app/features/auth/presentation/views/forget_pass_view.dart';
import 'package:clinic_booking_app/features/auth/presentation/views/register_view.dart';
import 'package:clinic_booking_app/features/home/home.dart';
import 'package:clinic_booking_app/features/onboarding/presentation/views/onboaring_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouting {
  static const rOnBoarding = '/';
  static const rLogin = '/LoginView';
  static const rRegister = '/RegisterView';
  static const rForgtetPass = '/ForgetPassView';
  static const rFillProfile = '/FillProfileView';
  static const rHome = '/Home';

  static final router = GoRouter(
    initialLocation: initialLocaton(),
    routes: [
      GoRoute(
        path: rOnBoarding,
        builder: (context, state) => const OnboaringView(),
      ),
      GoRoute(
        path: rLogin,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(getIt<FirebaseAuth>()),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: rRegister,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              RegisterCubit(getIt<FirebaseAuth>(), getIt<FirebaseFirestore>()),
          child: const RegisterView(),
        ),
      ),
      GoRoute(
        path: rForgtetPass,
        builder: (context, state) => BlocProvider(
          create: (context) => ForgetPassCubit(),
          child: const ForgetPassView(),
        ),
      ),
      GoRoute(
        path: rFillProfile,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => RegisterCubit(
                  getIt<FirebaseAuth>(),
                  getIt<FirebaseFirestore>(),
                ),
              ),
              BlocProvider(create: (context) => UserCubit()..getUserData()),
            ],
            child: FillProfileView(
              userName: data['name'],
              email: data['email'],
              password: data['password'],
            ),
          );
        },
      ),
      GoRoute(path: rHome, builder: (context, state) => const Home()),
    ],
  );

  static String initialLocaton() {
    final onBoarding = LocalStorage.getData(key: 'onBoarding');
    //   User? user = FirebaseAuth.instance.currentUser;
    if (onBoarding != null) {
      return rLogin;
    } else {
      return rOnBoarding;
    }
  }
}
