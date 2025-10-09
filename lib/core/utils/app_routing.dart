import 'package:clinic_booking_app/core/services/local_storage.dart';
import 'package:clinic_booking_app/features/Auth/presentation/views/login_view.dart';
import 'package:clinic_booking_app/features/onboarding/presentation/views/onboaring_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouting {
  static const rOnBoarding = '/';
  static const rLogin = '/LoginView';

  static final router = GoRouter(
    initialLocation: initialLocaton(),
    routes: [
      GoRoute(
        path: rOnBoarding,
        builder: (context, state) => const OnboaringView(),
      ),
      GoRoute(path: rLogin, builder: (context, state) => const LoginView()),
    ],
  );

  static String initialLocaton() {
    final onBoarding = LocalStorage.getData(key: 'onBoarding');
    if (onBoarding != null) {
      return rLogin;
    } else {
      return rOnBoarding;
    }
  }
}
