import 'package:flutter/material.dart';
import 'package:spend_smart/core/utility/size_config.dart';
import '../../constants.dart';
import '../utility/app_style.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({super.key});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDatePickerDialog(context);
      },
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios, size: 28),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
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
                  'May',
                  style: AppStyle.body2
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(width: 4),
                Text(
                  '2024',
                  style: AppStyle.body2
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_forward_ios, size: 28),
          ),
        ],
      ),
    );
  }
  void _showDatePickerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

            backgroundColor: Colors.white,
            alignment: const Alignment(0.0,-0.5),
            titleTextStyle:
            AppStyle.body2.copyWith(fontSize: 16, letterSpacing: 1.5),
            title: const Text(
              'Pick Month',
              textAlign: TextAlign.center,
            ),
            content: const DatePickerMonth());
      },
    );
  }

}

class DatePickerMonth extends StatelessWidget {
  const DatePickerMonth({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.viewWidth,
      height: SizeConfig.viewHeight! * .35,
      child: GridView.builder(
        itemCount: 12,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3/1.8,
                crossAxisSpacing: 12,
                mainAxisSpacing: 22,
            ),
        itemBuilder: (context, index) {
          return const CustomMonthBox(month: 'May');
        },
      ),
    );
  }
}

class CustomMonthBox extends StatelessWidget {
  final String month;

  const CustomMonthBox({super.key, required this.month});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: kBorderColor,
        ),
      ),
      child: Text(
        textAlign: TextAlign.center,
        month,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}