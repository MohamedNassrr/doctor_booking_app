import 'package:clinic_booking_app/features/home/data/models/categories_model.dart';

sealed class CategoryStates {}

final class CategoryInitialStates extends CategoryStates {}

final class CategoryLoadingStates extends CategoryStates {}

final class CategorySuccessStates extends CategoryStates {
  final List<CategoriesModel> categoryModel;

  CategorySuccessStates(this.categoryModel);
}

final class CategoryFailureStates extends CategoryStates {
  final String failure;

  CategoryFailureStates(this.failure);
}
