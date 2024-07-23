import 'package:go_router/go_router.dart';
import 'package:spend_smart/features/Login/presentation/views/login_view.dart';
import 'package:spend_smart/features/home/presentation/views/home_view.dart';
import 'package:spend_smart/features/root/presentation/views/root.dart';
import 'package:spend_smart/features/transation/presentation/views/transaction_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

// ALL PAGE ROUTERS ( MAIN VIEWS ) WILL SAVE HERE AND YOU CAN NAVIGATE THEM.
abstract class AppRouter {
  static const SPLASH_VIEW_PATH = '/';
  static const LOGIN_VIEW_PATH = '/login_view';
  static const HOME_VIEW_PATH = '/home_view';
  static const ROOT_PATH = '/root';
  static const TRANSACTION_VIEW_PATH = '/transaction_view';

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
        GoRoute(path: TRANSACTION_VIEW_PATH,
          builder: (context, state) => const TransactionView(),
        )
      ]

  );
}