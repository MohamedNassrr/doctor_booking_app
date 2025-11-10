sealed class SocialAuthStates {}

final class SocialAuthInitialState extends SocialAuthStates {}

final class GoogleSignInLoadingState extends SocialAuthStates {}

final class GoogleSignInSuccessState extends SocialAuthStates {}

final class GoogleSignInFailureState extends SocialAuthStates {
  final String failure;

  GoogleSignInFailureState(this.failure);
}

final class FacebookSignInLoadingState extends SocialAuthStates {}

final class FacebookSignInSuccessState extends SocialAuthStates {}

final class FacebookSignInFailureState extends SocialAuthStates {
  final String failure;

  FacebookSignInFailureState(this.failure);
}
