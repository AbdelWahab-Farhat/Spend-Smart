import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spend_smart/core/utility/app_strings.dart';
import 'package:spend_smart/core/utility/helper.dart';
import 'package:spend_smart/core/widgets/custom_loading_widget.dart';
import 'package:spend_smart/features/report/presentation/view/widgets/custom_date_picker.dart';
import 'package:spend_smart/core/widgets/custom_floating_button.dart';
import 'package:spend_smart/features/report/presentation/viewModel/pdf_cubit/pdf_cubit.dart';
import 'package:spend_smart/features/report/presentation/viewModel/report_cubit/report_cubit.dart';
import '../../../../../core/utility/app_style.dart';
import 'bloc_builder_bar.dart';
import 'list_view_details.dart';
import 'report_app_bar.dart';

class ReportViewBody extends StatefulWidget {
  const ReportViewBody({super.key});

  @override
  State<ReportViewBody> createState() => _ReportViewBodyState();
}

class _ReportViewBodyState extends State<ReportViewBody> {
  @override
  void initState() {
    context
        .read<ReportCubit>()
        .initTransactions(DateTime.now().year, DateTime.now().month);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ReportAppBar(),
      floatingActionButton: BlocConsumer<PdfCubit, PdfState>(
        listener: (context, state) {
          if (state is PdfFailure) {
            showTopSnackBar(context,state.errMessage );
          }
          if (state is PdfSuccess) {
            showTopSnackBar(context, state.successMessage);
          }
        },
        builder: (context, state) {
          if (state is PdfLoading) {
            return const CustomLoadingWidget();
          }
          return CustomFloatingButton(
            onPressed: () {
              context.read<PdfCubit>().downloadPdfReport();
            },
            icon: Icons.download,
            buttonText: 'Download report',
            width: 200,
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDatePicker(
                ctx: context,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(AppStrings.REPORT_OVERVIEW_TEXT,
                  style: AppStyle.headLine6.copyWith(
                      letterSpacing: 1.5,
                      fontSize: 15,
                      fontWeight: FontWeight.w600)),
              const BlocBuilderBar(),
              Text(
                AppStrings.REPORT_DETAILS_TEXT,
                style: AppStyle.headLine6.copyWith(
                    letterSpacing: 1.5,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              const ListViewDetails()
            ],
          ),
        ),
      ),
    );
  }
}
