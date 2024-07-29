import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spend_smart/core/repo/core_repo_impl.dart';
import 'package:spend_smart/features/report/data/repo/pdf_repo_impl.dart';
import 'package:spend_smart/features/report/presentation/view/widgets/report_view_body.dart';
import 'package:spend_smart/features/report/presentation/viewModel/pdf_cubit/pdf_cubit.dart';
import 'package:spend_smart/features/report/presentation/viewModel/report_cubit/report_cubit.dart';
import '../viewModel/date_picker/date_picker_cubit.dart';


class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DatePickerCubit(),
        ),
        BlocProvider(
          create: (context) => ReportCubit(CoreRepoImpl()),
        ),
        BlocProvider(
          create: (context) => PdfCubit(PdfRepoImpl()),
        ),
      ],
      child: const ReportViewBody(),
    );
  }
}
