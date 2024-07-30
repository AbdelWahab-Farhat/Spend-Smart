import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:spend_smart/core/models/category/category.dart';
import 'package:spend_smart/core/utility/size_config.dart';
import 'package:spend_smart/features/Login/data/repo/login_repo_impl.dart';
import 'package:spend_smart/features/Login/presentation/viewModel/login_cubit/login_cubit.dart';
import 'package:spend_smart/core/theme.dart';
import 'core/repo/core_repo_impl.dart';
import 'core/utility/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/home/presentation/viewModel/home_cubit.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  // Adapter Register
  Hive.registerAdapter(CategoryAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().initSizeConfig(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(LoginRepoImpl()),
        ),
        BlocProvider(
          create: (context) => HomeCubit(CoreRepoImpl()),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            inputDecorationTheme: CustomTheme.inputDecorationTheme,
            fontFamily: GoogleFonts
                .inter()
                .fontFamily
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
