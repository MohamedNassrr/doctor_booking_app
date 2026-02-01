sealed class LoginStates {}

final class LoginInitialState extends LoginStates {}

final class LoginLoadingState extends LoginStates {}

final class LoginSuccessState extends LoginStates {
  final String uId;

  LoginSuccessState(this.uId);
}

final class LoginFailureState extends LoginStates {
  final String failure;

  LoginFailureState(this.failure);
}

final class ChangePasswordVisibilityState extends LoginStates {}
