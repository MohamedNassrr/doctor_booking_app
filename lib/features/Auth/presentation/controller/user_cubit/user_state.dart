sealed class UserStates {}

final class UserInitialStates extends UserStates {}

final class UserGetDataLoadingStates extends UserStates {}

final class UserGetDataSuccessStates extends UserStates {}

final class UserGetDataFailureStates extends UserStates {
  final String failure;

  UserGetDataFailureStates(this.failure);
}
