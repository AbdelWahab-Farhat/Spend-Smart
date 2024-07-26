import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spend_smart/core/models/category/category.dart';
import 'package:spend_smart/features/transation/data/repo/category_repo/category_repo.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepo categoryRepo;
  List<Category>? categories;
  CategoryCubit(this.categoryRepo) : super(CategoryInitial());

  Future<void> addDefaultCategories() async {
    emit(CategoryLoading());
    var result = await categoryRepo.addDefaultCategories();
    result.fold(
      (failure) => emit(CategoryFailure(errMessage: failure.errMessage)),
      (_) {
      },
    );
  }

  Future<void> getDefaultCategories() async {
    emit(CategoryLoading());
    var result = await categoryRepo.getDefaultCategories();
    result.fold(
        (failure) {
          emit(CategoryFailure(errMessage: failure.errMessage));
        },
        (listOfCategory) {
          if (categories != null) {
            categories!.clear();
          }
      categories = listOfCategory;
      emit(CategorySuccess());
    });
  }
}
