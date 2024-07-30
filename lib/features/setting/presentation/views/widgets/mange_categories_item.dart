import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spend_smart/core/models/category/category_utils.dart';
import 'package:spend_smart/core/utility/app_router.dart';
import 'package:spend_smart/features/setting/presentation/viewModel/manage_categories_cubit/manage_categories_cubit.dart';

import '../../../../../core/models/category/category.dart';
import '../../../../../core/utility/app_style.dart';
import '../../../../../core/widgets/custom_category_widget.dart';

class MangeCategoriesItem extends StatelessWidget {
  final Category category;
  const MangeCategoriesItem({
    super.key, required this.category,
  });

  @override
  Widget build(BuildContext context) {
    var getManageCategoryCubit =  context.read<ManageCategoriesCubit>();
    List<num> rbgo = CategoryUtils.getRGBO(RGBO_STR: category.categoryRGBOColor);
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListTile(
        leading: CustomCategoryWidget(iconSvgPath: category.svgIconImg, iconBackgroundColor: Color.fromRGBO(rbgo[0].toInt(), rbgo[1].toInt(), rbgo[2].toInt(), rbgo[3].toDouble())),
        title: Text(category.categoryName,style:AppStyle.body2.copyWith(fontWeight: FontWeight.w600),),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(onPressed: (){
              GoRouter.of(context).push(AppRouter.EDIT_CATEGORIES_VIEW_PATH,extra: category);
            } , child: Text('Edit',style: AppStyle.headLine6.copyWith(fontSize: 16,color: Colors.blue,fontWeight: FontWeight.bold),)),
            IconButton(onPressed: ()=> getManageCategoryCubit.deleteCategory(category), icon: const Icon(Icons.delete_outline,color: Color(0xff9E9E9E),))
          ],
        ),
      ),
    );
  }
}
