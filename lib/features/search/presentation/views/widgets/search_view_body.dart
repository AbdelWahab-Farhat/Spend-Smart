import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spend_smart/constants.dart';
import 'package:spend_smart/features/search/presentation/views/widgets/filter_box.dart';
import 'package:spend_smart/features/search/presentation/views/widgets/result_section.dart';

import 'custom_search_bar.dart';

class SearchViewBody extends StatelessWidget {

  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
      statusBarColor: const Color(0xff212121).withOpacity(0.3),
    ));
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          CustomSearchBar(),
          SizedBox(height: 20,),
            ListViewFilters(),
            Divider(color: kBorderColor,),
            ResultSection(dayName: 'Today')
        ],),
      ),
    );
  }
}

class ListViewFilters extends StatelessWidget {
  const ListViewFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        padding: const EdgeInsets.only(right: 10),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
        return const FilterBox();
      },),
    );
  }
}



