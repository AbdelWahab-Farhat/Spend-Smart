import 'package:flutter/material.dart';

import '../../../../../core/enums/month_enum.dart';
import '../../../../../core/utility/size_config.dart';
import 'grid_view_month_box.dart';


class MonthGridView extends StatelessWidget {
  const MonthGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.viewWidth,
      height: SizeConfig.viewHeight! * .35,
      child: GridView.builder(
        itemCount: Month.values.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 3 / 1.8,
          crossAxisSpacing: 12,
          mainAxisSpacing: 22,
        ),
        itemBuilder: (context, index) {
          return GridViewMonthBox(month: Month.values[index].abbreviation);
        },
      ),
    );
  }
}
