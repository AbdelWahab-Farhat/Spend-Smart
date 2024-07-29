import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spend_smart/core/repo/core_repo_impl.dart';
import 'package:spend_smart/features/home/presentation/viewModel/home_cubit.dart';
import 'package:spend_smart/features/home/presentation/views/widgets/home_view_body.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeViewBody();
  }
}
