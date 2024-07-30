import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:spend_smart/core/models/category/category.dart';

part 'category_filter_state.dart';

class CategoryFilterCubit extends Cubit<CategoryFilterState> {
  CategoryFilterCubit() : super(CategoryFilterInitial());
  List<Category>?  categories;
  List<Category> filterCategories = [];

  Future<void> initCategories() async {
    categories = [];
    var box = Hive.isBoxOpen('CategoryBox') ? Hive.box('CategoryBox') : await Hive.openBox('CategoryBox');
    for (var category in box.values) {
      if (category is Category) {
        categories!.add(category);
      }
    }
    emit(CategoryFilterChanged());
  }

  void filtering(Category category) {
    if (filterCategories.contains(category)) {
      filterCategories.remove(category);
    }
    else {
      filterCategories.add(category);
    }
    emit(CategoryFilterChanged());
  }
  bool isFiltered(Category category) {
    return filterCategories.contains(category);
  }
}
