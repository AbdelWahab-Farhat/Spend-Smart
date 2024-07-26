part of 'new_category_cubit.dart';

@immutable
sealed class NewCategoryState {}

final class NewCategoryInitial extends NewCategoryState {}
final class NewCategoryLoading extends NewCategoryState {}
final class NewCategoryFailure extends NewCategoryState {
  final String errMessage;
  NewCategoryFailure({required this.errMessage});
}
final class NewCategorySuccess extends NewCategoryState {}
