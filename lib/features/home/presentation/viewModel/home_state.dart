part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeLoading extends HomeState {}
final class HomeFailure extends HomeState {
  final String errMessage;

  HomeFailure({required this.errMessage});
}
final class HomeSuccess extends HomeState {
  final List<Transaction> transactions;
  HomeSuccess({required this.transactions});

}
