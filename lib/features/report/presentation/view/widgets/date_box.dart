import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/enums/month_enum.dart';
import '../../../../../core/utility/app_style.dart';
import '../../viewModel/date_picker/date_picker_cubit.dart';
import '../../viewModel/report_cubit/report_cubit.dart';

class DateBox extends StatelessWidget {
  const DateBox({
    super.key,
    required this.datePickerCubit,
  });

  final DatePickerCubit datePickerCubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: (){
            datePickerCubit.yearDown();
            context.read<ReportCubit>().initTransactions(
                datePickerCubit.currentYearPicked,
                datePickerCubit.currentMonthPicked
            );
          },
          icon: const Icon(Icons.arrow_back_ios, size: 28),
        ),
        const Spacer(),
        Container(
          padding:
          const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xffF5F5F5),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.calendar_today,
                  color: kOnSecondaryColor, size: 16, weight: 400),
              const SizedBox(width: 8),
              Text(
                "${MonthExtension.getMonthName(
                    datePickerCubit.currentMonthPicked)},",
                style: AppStyle.body2
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(width: 4),
              Text(
                datePickerCubit.currentYearPicked.toString(),
                style: AppStyle.body2
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: (){
            datePickerCubit.yearUp();
            context.read<ReportCubit>().initTransactions(
                datePickerCubit.currentYearPicked,
                datePickerCubit.currentMonthPicked
            );
          },
          icon: const Icon(Icons.arrow_forward_ios, size: 28),
        ),
      ],
    );
  }
}
