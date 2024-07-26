part of 'transaction_cubit.dart';

@immutable
sealed class TransactionState {}

final class TransactionInitial extends TransactionState {}
final class TransactionChanged extends TransactionState {}
final class TransactionLoading extends TransactionState {}

final class TransactionFailure extends TransactionState {
  final String errMessage;

  TransactionFailure({required this.errMessage});

}
final class TransactionSuccess extends TransactionState {
  final String successMessage;
  TransactionSuccess({required this.successMessage});
}

