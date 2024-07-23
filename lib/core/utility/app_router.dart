import 'package:go_router/go_router.dart';
import 'package:spend_smart/features/Login/presentation/views/login_view.dart';
import 'package:spend_smart/features/home/presentation/views/home_view.dart';
import 'package:spend_smart/features/report/presentation/view/report_view.dart';
import 'package:spend_smart/features/root/presentation/views/root.dart';
import 'package:spend_smart/features/search/presentation/views/search_view.dart';
import 'package:spend_smart/features/setting/presentation/views/setting_view.dart';
import 'package:spend_smart/features/transation/presentation/views/new_category_view.dart';
import 'package:spend_smart/features/transation/presentation/views/transaction_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

// ALL PAGE ROUTERS ( MAIN VIEWS ) WILL SAVE HERE AND YOU CAN NAVIGATE THEM.
abstract class AppRouter {
  static const SPLASH_VIEW_PATH = '/';
  static const LOGIN_VIEW_PATH = '/login_view';
  static const HOME_VIEW_PATH = '/home_view';
  static const SETTING_VIEW_PATH ='/setting_view';
  static const REPORT_VIEW_PATH = '/report_view';
  static const ROOT_PATH = '/root';
  static const TRANSACTION_VIEW_PATH = '/transaction_view';
  static const SEARCH_VIEW_PATH = '/search_view';
  static const NEW_CATEGORY_VIEW_PATH = '/new_category_view';

  static final router = GoRouter(
      routes: [
        GoRoute(path: SPLASH_VIEW_PATH,
          builder: (context, state) => const SplashView(),
        ),
        GoRoute(path: ROOT_PATH,
          builder: (context, state) =>  const Root(),
        ),
        GoRoute(path: LOGIN_VIEW_PATH,
          builder: (context, state) => const LoginView(),
        ),
        GoRoute(path: HOME_VIEW_PATH,
          builder: (context, state) => const HomeView(),
        ),
        GoRoute(path: REPORT_VIEW_PATH,
          builder: (context, state) => const ReportView(),
        ),
        GoRoute(path: SETTING_VIEW_PATH,
          builder: (context, state) => const SettingView(),
        ),
        GoRoute(path: TRANSACTION_VIEW_PATH,
          builder: (context, state) => const TransactionView(),
        ),
        GoRoute(path: SEARCH_VIEW_PATH,
          builder: (context, state) => const SearchView(),
        ),
        GoRoute(path: NEW_CATEGORY_VIEW_PATH,
          builder: (context, state) => const NewCategoryView(),
        )
      ]

  );
}