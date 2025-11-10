sealed class RegisterStates {}

final class RegisterInitialStates extends RegisterStates {}

final class RegisterLoadingStates extends RegisterStates {}

final class RegisterSuccessStates extends RegisterStates {}

final class RegisterFailureStates extends RegisterStates {
  final String failure;

  RegisterFailureStates(this.failure);
}

final class CreateUserRegisterSuccessStates extends RegisterStates {}

final class CreateUserRegisterFailureStates extends RegisterStates {
  final String failure;

  CreateUserRegisterFailureStates(this.failure);
}


final class ChangePasswordVisibilityState extends RegisterStates {}
