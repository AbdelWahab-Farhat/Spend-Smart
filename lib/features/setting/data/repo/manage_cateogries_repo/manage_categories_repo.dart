

import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/models/category/category.dart';

abstract class ManageCategoriesRepo {
  Future<Either<Failure,List<Category>>> fetchUserCategories();
  Future<Either<Failure,String>> deleteCategory(Category category);
  Future<Either<Failure,String>> editCategory(Category category);
}