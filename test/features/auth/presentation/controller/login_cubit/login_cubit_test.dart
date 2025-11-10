import 'package:bloc_test/bloc_test.dart';
import 'package:clinic_booking_app/features/auth/presentation/controller/login_cubit/login_cubit.dart';
import 'package:clinic_booking_app/features/auth/presentation/controller/login_cubit/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUser extends Mock implements User {}

class MockUserCredintial extends Mock implements UserCredential {}

late MockFirebaseAuth mockAuth;
late MockUserCredintial mockUserCredintial;
late LoginCubit loginCubit;
late MockUser mockUser;

void main() {
  setUp(() {
    mockAuth = MockFirebaseAuth();
    mockUserCredintial = MockUserCredintial();
    mockUser = MockUser();
    loginCubit = LoginCubit(mockAuth);
  });

  group('login test -', () {
    blocTest<LoginCubit, LoginStates>(
      'should emits [loading,success] when userAccount is correct.',
      build: () {
        when(
          () => mockAuth.signInWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) async => mockUserCredintial);

        when(() => mockUserCredintial.user).thenReturn(mockUser);
        when(() => mockUser.uid).thenReturn('12345');
        when(() => mockAuth.currentUser).thenReturn(mockUser);
        return loginCubit;
      },
      act: (cubit) =>
          cubit.userLogin(email: 'mo@gmail.com', password: '123456'),
      expect: () => [isA<LoginLoadingState>(), isA<LoginSuccessState>()],
    );

    blocTest<LoginCubit, LoginStates>(
      'should emit[loading failure] when failed to login',
      build: () {
        when(
          () => mockAuth.signInWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(FirebaseAuthException(code: 'wrong-password'));
        when(() => mockUserCredintial.user).thenReturn(mockUser);
        when(() => mockUser.uid).thenReturn('12345');
        when(() => mockAuth.currentUser).thenReturn(mockUser);
        return loginCubit;
      },
      act: (cubit) =>
          cubit.userLogin(email: 'mo@gmail.com', password: 'wrong456'),
      expect: () => [
        isA<LoginLoadingState>(),
        predicate<LoginFailureState>(
          (state) => state.failure == 'wrong-password',
        ),
      ],
    );
  });
}
