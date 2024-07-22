import 'package:flutter/material.dart';

import '../../constants.dart';
import '../utility/app_style.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(children: [
      IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios,size: 28,),),
      const Spacer(),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xffF5F5F5),
          borderRadius: BorderRadius.circular(50),
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.calendar_today,color: kOnSecondaryColor,size: 16,weight: 400,),
            const SizedBox(width: 8,),
            Text('May,',style: AppStyle.body2.copyWith(fontWeight: FontWeight.bold,fontSize: 16),),
            const SizedBox(width: 4,),
            Text('2024',style: AppStyle.body2.copyWith(fontWeight: FontWeight.bold,fontSize: 16,))
          ],
        ),
      ),
      const Spacer(),
      IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios,size: 28,),),
    ],);
  }
}
