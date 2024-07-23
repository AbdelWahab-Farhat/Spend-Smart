import 'package:flutter/material.dart';
import 'package:spend_smart/features/transation/presentation/views/widgets/gird_view_item.dart';


class BottomSheetGridView extends StatelessWidget {
  const BottomSheetGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 20),
      physics: const ClampingScrollPhysics(),
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 70,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
          crossAxisCount: 3
      ),
      itemCount: 9,
      itemBuilder: (context, index) => const GirdViewItem(),
    );
  }
}
