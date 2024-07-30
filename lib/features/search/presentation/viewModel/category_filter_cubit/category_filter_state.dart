part of 'category_filter_cubit.dart';

@immutable
sealed class CategoryFilterState {}

final class CategoryFilterInitial extends CategoryFilterState {}
final class CategoryFilterChanged extends CategoryFilterState {}
