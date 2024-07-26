import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../../core/models/category/category.dart';
import '../../../data/repo/category_repo/category_repo.dart';

part 'new_category_state.dart';

class NewCategoryCubit extends Cubit<NewCategoryState> {
  final CategoryRepo categoryRepo;
   String? categoryName;
   var formKey = GlobalKey<FormState>();
  NewCategoryCubit(this.categoryRepo) : super(NewCategoryInitial());



  Future<void> addNewCategory(Category category) async {
      emit(NewCategoryLoading());
      var  result = await categoryRepo.addNewCategory(category);
      result.fold((l) =>emit(NewCategoryFailure(errMessage: l.errMessage)), (_) =>
        emit(NewCategorySuccess())
        ,);
  }
}
