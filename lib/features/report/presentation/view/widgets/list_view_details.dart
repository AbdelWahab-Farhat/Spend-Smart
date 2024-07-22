import 'package:flutter/material.dart';
import 'list_tile_details.dart';

class ListViewDetails extends StatelessWidget {
  const ListViewDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) => const ListTileDetails(),);
  }
}
