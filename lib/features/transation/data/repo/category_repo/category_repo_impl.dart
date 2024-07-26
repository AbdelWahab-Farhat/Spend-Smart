

import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spend_smart/core/errors/failure.dart';
import 'package:spend_smart/core/models/category/category.dart';
import 'package:spend_smart/features/transation/data/repo/category_repo/category_repo.dart';

import '../../../../../core/models/category/category_utils.dart';

class CategoryRepoImpl  extends CategoryRepo{
  @override
  Future<Either<Failure, void>> addDefaultCategories() async {
    try {
      final sharedPrefs = await SharedPreferences.getInstance();
      final isFirstTime = sharedPrefs.getBool('firstTime') ?? true;

      if (!isFirstTime) {
        return right(null);
      }

      // Mark that the app has been initialized with default categories
      await sharedPrefs.setBool('firstTime', false);

      // Open the Hive box for categories
      var categoryBox = await Hive.openBox<Category>('CategoryBox');

      // Add default categories
      for (var category in CategoryUtils.defaultCategories()) {
        await categoryBox.put(category.categoryID, category);
      }
      // close the box
      await categoryBox.close();

      return right(null);
    }on HiveError catch (e) {
      return left(LocalDatabaseFailure(errMessage: e.message));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getDefaultCategories() async {
    try {
      var categoryBox = Hive.isBoxOpen('CategoryBox')
          ? Hive.box('CategoryBox')
          : await Hive.openBox('CategoryBox');
      List<Category> categories = categoryBox.values.cast<Category>().toList();
      // cast the values safely
      return right(categories);
    } on HiveError catch (e) {
      return left(LocalDatabaseFailure(errMessage: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> addNewCategory(Category category) async {
    try {
      var categoryBox = await Hive.openBox('CategoryBox');
      categoryBox.put(category.categoryID, category);
      return right(null);
    } on HiveError catch (e) {
      return left(LocalDatabaseFailure(errMessage: e.message));
    }
  }
}