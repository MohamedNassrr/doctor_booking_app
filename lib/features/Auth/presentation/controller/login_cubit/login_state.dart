sealed class LoginStates {}

final class LoginInitialState extends LoginStates {}

final class LoginLoadingState extends LoginStates {}

final class LoginSuccessState extends LoginStates {}

final class LoginFailureState extends LoginStates {
  final String faiure;

  LoginFailureState(this.faiure);
}

final class ChangePasswordVisibilityState extends LoginStates {}
