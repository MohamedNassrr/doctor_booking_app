sealed class ForgetPassStates {}

final class ForgetPassInitialStates extends ForgetPassStates {}

final class ForgetPassLoadingStates extends ForgetPassStates {}

final class ForgetPassSuccessStates extends ForgetPassStates {}

final class ForgetPassFailureStates extends ForgetPassStates {
  final String failure;

  ForgetPassFailureStates(this.failure);
}
