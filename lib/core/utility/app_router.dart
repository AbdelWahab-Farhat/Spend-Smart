import 'package:go_router/go_router.dart';
import 'package:spend_smart/features/Login/presentation/views/login_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const SPLASH_VIEW_PATH = '/';
  static const LOGIN_VIEW_PATH = '/login_view';


  static final router = GoRouter(
      routes: [
        GoRoute(path: SPLASH_VIEW_PATH,
          builder: (context, state) => const SplashView(),
        ),
        GoRoute(path: LOGIN_VIEW_PATH,
          builder: (context, state) => const LoginView(),
        )
      ]

  );
}