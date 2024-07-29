import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:spend_smart/core/models/category/category_utils.dart';

import '../../../../../core/models/transaction/transaction.dart';
import '../../../../../core/utility/app_strings.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/models/transaction/transaction_utils.dart';
import 'pdf_repo.dart';

class PdfRepoImpl extends PdfRepo {
  @override
  Future<Either<Failure, String>> generatePDF(
      DateTime time, Map<String, List<Transaction>> categorizedTransactions) async {
    try {
      final pdf = pw.Document();

      List<pw.Widget> content = [];

      categorizedTransactions.entries.forEach((entry) {
        var categoryID = entry.key;
        var transactions = entry.value;
        double transactionsPrice = transactions.fold(0.0, (sum, element) {
          return sum += element.amount;
        });
        String hexColor = CategoryUtils.rgboToHex(transactions.first.category.categoryRGBOColor);
        double percent = TransactionUtils.countTransactionPercent(categorizedTransactions, categoryID);

        content.add(
          pw.Container(
            padding: const pw.EdgeInsets.all(10),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Container(
                  padding: const pw.EdgeInsets.all(8),
                  decoration: pw.BoxDecoration(
                    color: PdfColor.fromHex(hexColor),
                  ),
                  child: pw.Row(
                    children: [
                      pw.Text(
                        transactions.first.category.categoryName,
                        style: pw.TextStyle(fontSize: 17, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.Spacer(),
                      pw.Text(
                        '- ${AppStrings.currency} $transactionsPrice',
                        style: const pw.TextStyle(color: PdfColors.black, fontSize: 15),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(height: 8),
                pw.Text(
                  '${transactions.length} ${AppStrings.REPORT_TRANSACTIONS_TEXT}',
                  style: const pw.TextStyle(color: PdfColor(0, 0.5, 1)),
                ),
                pw.SizedBox(height: 4),
                pw.Text(
                  '${percent.toStringAsFixed(1)}%',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      });

      pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.ListView(children: content);
        },
      ));

      // Save the PDF to a file
      final output = await getTemporaryDirectory();
      final file = File("${output?.path}/example.pdf");
      await file.writeAsBytes(await pdf.save());

      return Right(file.path);
    } on Exception catch (e) {
      return Left(PDFFailure(errMessage: e.toString().padLeft(2)));
    }
  }

  // Add a helper function to get the temporary directory
  Future<Directory?> getTemporaryDirectory() async {
    if (Platform.isAndroid) {
      return await getExternalStorageDirectory();
    } else {
      return await getApplicationDocumentsDirectory();
    }
  }
}
