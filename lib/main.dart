import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spend_smart/core/utility/size_config.dart';
import 'package:spend_smart/features/Login/data/repo/login_repo_impl.dart';
import 'package:spend_smart/features/Login/presentation/viewModel/login_cubit/login_cubit.dart';
import 'package:spend_smart/core/theme.dart';
import 'core/utility/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
          ledColor: Colors.blue,
          channelGroupKey: 'basic_channel_group',
          channelKey: 'basic_channel',
          channelName: 'info Notification',
          channelDescription: 'For Sending data')
    ],
    channelGroups: [
      NotificationChannelGroup(
          channelGroupKey: 'basic_channel_group',
          channelGroupName: 'basic group')
    ],
  );
  bool isAllowedToSendNotification = await AwesomeNotifications()
      .isNotificationAllowed();
  if (!isAllowedToSendNotification) {
    AwesomeNotifications().requestPermissionToSendNotifications();
  }


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().initSizeConfig(context);

    return BlocProvider(
      create: (context) => LoginCubit(LoginRepoImpl()),
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
