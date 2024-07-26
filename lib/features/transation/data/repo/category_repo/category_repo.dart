
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/models/category/category.dart';

abstract class CategoryRepo {
  Future<Either<Failure,void>> addDefaultCategories();
  Future<Either<Failure,List<Category>>> getDefaultCategories();
  Future<Either<Failure,void>> addNewCategory(Category category);
}