import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:clinic_booking_app/features/home/data/repos/home_repos/home_repo.dart';
import 'package:clinic_booking_app/features/home/presentation/controller/category_cubit/category_state.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit(this.homeRepo) : super(CategoryInitialStates());

  final HomeRepo homeRepo;

  Future<void> getCategories() async {
    emit(CategoryLoadingStates());
    var result = await homeRepo.fetchCategories();

    result.fold(
      (failure) {
        log('category api failure: ${failure.toString()}');
        emit(CategoryFailureStates(failure.errMessage));
      },
      (success) {
        emit(CategorySuccessStates(success));
      },
    );
  }
}
