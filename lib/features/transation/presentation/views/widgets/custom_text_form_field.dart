import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spend_smart/constants.dart';
import 'package:spend_smart/core/utility/app_strings.dart';
import 'package:spend_smart/core/utility/app_style.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final bool isAmount;
  const CustomTextFormField(
      {super.key, required this.label, required this.isAmount});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        return null;
      },
      style: AppStyle.body2.copyWith(fontSize: 15, color: kAccentColor),
      keyboardType: isAmount
          ? const TextInputType.numberWithOptions(decimal: true)
          : null,
      inputFormatters:
          isAmount ? [FilteringTextInputFormatter.digitsOnly] : null,
      decoration: InputDecoration(
        prefix: isAmount
            ? Text(
                "${AppStrings.currency}\t",
                style: AppStyle.body2.copyWith(
                    fontSize: 15,
                    color: kAccentColor,
                    fontWeight: FontWeight.w800),
              )
            : null,
        labelText: label,
      ),
    );
  }
}
