import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:spend_smart/core/errors/failure.dart';
import 'package:spend_smart/core/models/category/category.dart';
import 'package:spend_smart/features/setting/data/repo/manage_cateogries_repo/manage_categories_repo.dart';

class ManageCategoriesRepoImpl extends ManageCategoriesRepo {
  @override
  Future<Either<Failure, List<Category>>> fetchUserCategories() async {
    try {
      final box = Hive.isBoxOpen("CategoryBox")
          ? Hive.box("CategoryBox")
          : await Hive.openBox("CategoryBox");
      final categories = box.values
          .where((item) {
        return item is Category && !item.isDefault();
      })
          .cast<Category>()
          .toList();
      return Right(categories);
    } on HiveError catch (e) {
      return Left(LocalDatabaseFailure(errMessage: e.message));
    }
  }

  @override
  Future<Either<Failure, String>> deleteCategory(Category category) async {
    try {
      final box = Hive.isBoxOpen("CategoryBox")
          ? Hive.box("CategoryBox")
          : await Hive.openBox("CategoryBox");
      final key = box
          .toMap()
          .entries
          .firstWhere((entry) => entry.value.categoryID == category.categoryID)
          .key;

      // Delete the category by key
      await box.delete(key);
      return right('Deleted Successfully');
    } on HiveError catch (e) {
      return left(LocalDatabaseFailure(errMessage: e.message));
    } catch (e) {
      return left(LocalDatabaseFailure(errMessage: e.toString()));
    }
  }

  @override

  Future<Either<Failure, String>> editCategory(Category category) async {
    try {
      final box = Hive.isBoxOpen("CategoryBox")
          ? Hive.box("CategoryBox")
          : await Hive.openBox("CategoryBox");

      // Find the key of the category to be edited
      final key = box.toMap().entries
          .firstWhere((entry) => entry.value.categoryID == category.categoryID)
          .key;

      // Update the category by key
      await box.put(key, category);

      return right('Category Updated Successfully');
    } on HiveError catch (e) {
      return Left(LocalDatabaseFailure(errMessage: e.message));
    } catch (e) {
      return Left(LocalDatabaseFailure(errMessage: e.toString()));
    }
  }
}
