import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spend_smart/features/Login/presentation/views/login_view.dart';
import 'package:spend_smart/features/root/presentation/views/root.dart';
import 'splash_view_widget.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashViewWidget();
          }
          else if (snapshot.hasData) {
            return const Root();
          }
          else {
            return const LoginView();
          }
        }
      ),
    );
  }
}

