import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spend_smart/features/report/presentation/viewModel/report_cubit/report_cubit.dart';

class OverViewBar extends StatelessWidget {
  final List<double> expenses;
  final List<Color> colors;

  const OverViewBar({
    super.key,
    required this.expenses,
    required this.colors,
  }) : assert(expenses.length == colors.length);

  @override
  Widget build(BuildContext context) {
    double maxExpense = expenses.reduce((a, b) => a > b ? a : b);
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 20),
      child: Container(
        height: 36.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          children: expenses.asMap().entries.map((entry) {
            int idx = entry.key;
            double expense = entry.value;
            double proportion = expense / maxExpense;
            return Expanded(
              flex: (proportion * 100).toInt(),
              child: Container(
                decoration: BoxDecoration(
                  color: colors[idx],
                  borderRadius: BorderRadius.only(
                    topLeft: idx == 0
                        ? const Radius.circular(15.0)
                        : Radius.zero,
                    bottomLeft: idx == 0
                        ? const Radius.circular(15.0)
                        : Radius.zero,
                    topRight: idx == expenses.length - 1
                        ? const Radius.circular(15.0)
                        : Radius.zero,
                    bottomRight: idx == expenses.length - 1
                        ? const Radius.circular(15.0)
                        : Radius.zero,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
