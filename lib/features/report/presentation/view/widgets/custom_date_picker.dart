import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spend_smart/features/report/presentation/viewModel/pdf_cubit/pdf_cubit.dart';
import '../../viewModel/date_picker/date_picker_cubit.dart';
import '../../viewModel/report_cubit/report_cubit.dart';
import '../../../../../core/utility/app_style.dart';
import 'date_box.dart';
import 'month_grid_view.dart';

class CustomDatePicker extends StatelessWidget {
  final BuildContext ctx;

  const CustomDatePicker({super.key, required this.ctx});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDatePickerDialog(context);
      },
      child: BlocBuilder<DatePickerCubit, DatePickerState>(
        builder: (context, state) {
          final DatePickerCubit datePickerCubit = context.read<DatePickerCubit>();
          // Date takin
          context.read<PdfCubit>().initPdfDate(DateTime(datePickerCubit.currentYearPicked,datePickerCubit.currentMonthPicked));
          return DateBox(datePickerCubit: datePickerCubit);
        },
      ),
    );
  }


  void _showDatePickerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: BlocProvider.of<DatePickerCubit>(ctx),
            ),
            BlocProvider.value(
              value: BlocProvider.of<ReportCubit>(ctx),
            ),
          ],
          child: AlertDialog(
              backgroundColor: Colors.white,
              alignment: const Alignment(0.0, -0.5),
              titleTextStyle:
              AppStyle.body2.copyWith(fontSize: 16, letterSpacing: 1.5),
              title: const Text(
                'Pick Month',
                textAlign: TextAlign.center,
              ),
              content: const MonthGridView()),
        );
      },
    );
  }
}



