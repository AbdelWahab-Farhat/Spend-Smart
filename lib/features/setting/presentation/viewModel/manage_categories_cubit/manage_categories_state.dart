part of 'manage_categories_cubit.dart';

@immutable
sealed class ManageCategoriesState {}

final class ManageCategoriesInitial extends ManageCategoriesState {}
final class ManageCategoriesLoading extends ManageCategoriesState {}
final class ManageCategoriesSuccess extends ManageCategoriesState {
  final List<Category> categories;
  ManageCategoriesSuccess({required this.categories});
}
final class ManageCategoriesFailure extends ManageCategoriesState {
  final String errMessage;

  ManageCategoriesFailure({required this.errMessage});
}
