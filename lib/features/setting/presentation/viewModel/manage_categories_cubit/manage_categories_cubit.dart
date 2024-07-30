import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../../core/models/category/category.dart';
import '../../../data/repo/manage_cateogries_repo/manage_categories_repo.dart';

part 'manage_categories_state.dart';

class ManageCategoriesCubit extends Cubit<ManageCategoriesState> {
  final ManageCategoriesRepo manageCategoriesRepo;
  final formKey = GlobalKey<FormState>();
  ManageCategoriesCubit(this.manageCategoriesRepo)
      : super(ManageCategoriesInitial());

  Future<void> fetchUserCategories() async {
    emit(ManageCategoriesLoading());
    var result = await manageCategoriesRepo.fetchUserCategories();
    result.fold(
      (l) => emit(ManageCategoriesFailure(errMessage: l.errMessage)),
      (r) => emit(ManageCategoriesSuccess(categories: r)),
    );
  }
  Future<void> deleteCategory(Category category) async {
    emit(ManageCategoriesLoading());
    await manageCategoriesRepo.deleteCategory(category);
    fetchUserCategories();
  }

  Future<void> editCategory(Category category) async {
    emit(ManageCategoriesLoading());
    await manageCategoriesRepo.editCategory(category);
    await fetchUserCategories();
  }
}
