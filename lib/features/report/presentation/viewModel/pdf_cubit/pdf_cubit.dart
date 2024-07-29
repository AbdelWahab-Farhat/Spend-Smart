import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/models/transaction/transaction.dart';
import '../../../data/repo/pdf_repo.dart';
part 'pdf_state.dart';

class PdfCubit extends Cubit<PdfState> {
  final PdfRepo pdfRepo;
  PdfCubit(this.pdfRepo) : super(PdfInitial());
  DateTime? _dateTime;
  Map<String, List<Transaction>>? _categorizedTransactions;

  void initPdfDate(DateTime time) {
    _dateTime = time;
  }

  void initCategorizedTransactions(
      Map<String, List<Transaction>> categorizedTransactions) {
    _categorizedTransactions = categorizedTransactions;
  }

  Future<void> downloadPdfReport() async {
    emit(PdfLoading());
    if (_dateTime == null || _categorizedTransactions == null) {
      emit(PdfFailure(errMessage: 'Opps, Cannot Download Document Right Now'));
      return;
    }
    var result =
        await pdfRepo.generatePDF(_dateTime!, _categorizedTransactions!);
    result.fold(
      (l) => emit(PdfFailure(errMessage: l.errMessage)),
      (r) => emit(PdfSuccess(successMessage: r)),
    );
  }
}
