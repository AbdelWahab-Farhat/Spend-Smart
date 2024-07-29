part of 'report_cubit.dart';

@immutable
sealed class ReportState {}

final class ReportInitial extends ReportState {}
final class ReportLoading extends ReportState {}
final class ReportSuccess extends ReportState {
  final List<Transaction> transactions;
  ReportSuccess({required this.transactions});
}
final class ReportFailure extends ReportState {
  final String errMessage;
  ReportFailure({required this.errMessage});
}

