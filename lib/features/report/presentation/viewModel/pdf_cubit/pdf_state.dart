part of 'pdf_cubit.dart';

@immutable
sealed class PdfState {}

final class PdfInitial extends PdfState {}
final class PdfLoading extends PdfState {}
final class PdfFailure extends PdfState {
  final String errMessage;

  PdfFailure({required this.errMessage});
}
final class PdfSuccess extends PdfState {
  final String successMessage;
  PdfSuccess({required this.successMessage});

}
