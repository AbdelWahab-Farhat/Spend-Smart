
import 'package:uuid/uuid.dart';

import '../../utility/app_assets.dart';
import 'category.dart';

class CategoryUtils {
  static List<Category> defaultCategories() {
    return [
      Category(
        categoryRGBOColor: '163,128,23,0.3',
        categoryID: const Uuid().v4(),
        categoryName: 'Other',
        svgIconImg: AppAssets.CASH_ICON_PATH,
      ),
      Category(
        categoryRGBOColor: '255,87,34,0.3',
        categoryID: const Uuid().v4(),
        categoryName: 'Cafe',
        svgIconImg: AppAssets.CAFE_ICON_PATH,
      ),
      Category(
        categoryRGBOColor: '76,175,80,0.3',
        categoryID: const Uuid().v4(),
        categoryName: 'Commute',
        svgIconImg: AppAssets.COMMUTE_ICON_PATH,
      ),
      Category(
        categoryRGBOColor: '63,81,181,0.3',
        categoryID: const Uuid().v4(),
        categoryName: 'Grocery',
        svgIconImg: AppAssets.GROCERY_ICON_PATH,
      ),
      Category(
        categoryRGBOColor: '244,67,54,0.3',
        categoryID: const Uuid().v4(),
        categoryName: 'Health',
        svgIconImg: AppAssets.HEALTH_ICON_PATH,
      ),
      Category(
        categoryRGBOColor: '158,158,158,0.3',
        categoryID: const Uuid().v4(),
        categoryName: 'Laundry',
        svgIconImg: AppAssets.LAUNDRY_ICON_PATH,
      ),
      Category(
        categoryRGBOColor: '255,152,0,0.3',
        categoryID: const Uuid().v4(),
        categoryName: 'Restaurant',
        svgIconImg: AppAssets.RESTAURANT_ICON_PATH,
      ),
      Category(
        categoryRGBOColor: '96,125,139,0.3',
        categoryID: const Uuid().v4(),
        categoryName: 'Liquor',
        svgIconImg: AppAssets.LIQUOR_ICON_PATH,
      ),
      Category(
        categoryRGBOColor: '233,30,99,0.3',
        categoryID: const Uuid().v4(),
        categoryName: 'Gifts',
        svgIconImg: AppAssets.GIFTS_ICON_PATH,
      ),
      Category(
        categoryRGBOColor: '33,150,243,0.3',
        categoryID: const Uuid().v4(),
        categoryName: 'Electronics',
        svgIconImg: AppAssets.ELECTRONICS_ICON_PATH,
      ),
      Category(
        categoryRGBOColor: '205,220,57,0.3',
        categoryID: const Uuid().v4(),
        categoryName: 'Sports',
        svgIconImg: AppAssets.BALL_ICON_PATH,
      ),
      Category(
        categoryRGBOColor: '103,58,183,0.3',
        categoryID: const Uuid().v4(),
        categoryName: 'Chirty',
        svgIconImg: AppAssets.CHIRTY_ICON_PATH,
      ),
      Category(
        categoryRGBOColor: '255,193,7,0.3',
        categoryID: const Uuid().v4(),
        categoryName: 'School && Collage',
        svgIconImg: AppAssets.HAT_ICON_PATH,
      ),
      Category(
        categoryRGBOColor: '139,195,74,0.3',
        categoryID: const Uuid().v4(),
        categoryName: 'GAS',
        svgIconImg: AppAssets.GAS_ICON_PATH,
      ),
      Category(
        categoryRGBOColor: '255,87,34,0.3',
        categoryID: const Uuid().v4(),
        categoryName: 'Hobbies',
        svgIconImg: AppAssets.YOGA_ICON_PATH,
      ),
      Category(
        categoryRGBOColor: '76,175,80,0.3',
        categoryID: const Uuid().v4(),
        categoryName: 'Saving',
        svgIconImg: AppAssets.SAVINGS_ICON_PATH,
      ),
      Category(
        categoryRGBOColor: '0,150,136,0.3',
        categoryID: const Uuid().v4(),
        categoryName: 'Party',
        svgIconImg: AppAssets.PARTY_ICON_PATH,
      ),
    ];
  }

  static List<num> getRGBO({required String RGBO_STR}) {
    return RGBO_STR.split(',')
        .map(
          (e) => num.parse(e),
    ).toList();
  }
}
