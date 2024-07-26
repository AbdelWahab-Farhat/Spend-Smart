import 'package:flutter/material.dart';
import 'package:spend_smart/core/utility/app_style.dart';
import 'package:spend_smart/core/utility/size_config.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errMessage;
  const CustomErrorWidget({super.key, required this.errMessage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: SizeConfig.viewWidth! * .95,
        child: Text(
          errMessage,
          style:
              AppStyle.headLine6.copyWith(color: Colors.red.withOpacity(0.9)),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ));
  }
}
