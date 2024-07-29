import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constants.dart';
import '../../../../../core/enums/month_enum.dart';
import '../../viewModel/date_picker/date_picker_cubit.dart';
import '../../viewModel/report_cubit/report_cubit.dart';


class GridViewMonthBox extends StatelessWidget {
  final String month;

  const GridViewMonthBox({super.key, required this.month});

  @override
  Widget build(BuildContext context) {
    DatePickerCubit datePickerCubit = context.read<DatePickerCubit>();
    int currentMonthNumber = datePickerCubit.currentMonthPicked;
    String currentMonthName = MonthExtension.getMonthName(currentMonthNumber);
    bool isSelected = currentMonthName == month;

    return GestureDetector(
      onTap: () {
        datePickerCubit
            .changeCurrentMonth(MonthExtension.getMonthNumber(month));

        context.read<ReportCubit>().initTransactions(
            datePickerCubit.currentYearPicked,
            datePickerCubit.currentMonthPicked
        );
        GoRouter.of(context).pop();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xff007BEF) : Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: isSelected ? null : Border.all(color: kBorderColor),
        ),
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            month,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
