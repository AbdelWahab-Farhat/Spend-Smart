import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spend_smart/core/repo/core_repo.dart';

import '../../../../core/models/transaction/transaction.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final CoreRepo coreRepo;
  int counter = 0;
  HomeCubit(this.coreRepo) : super(HomeInitial());

  Future<void> getUserTransaction () async {
    emit(HomeLoading());
    var result  = await coreRepo.userTransaction();
    result.fold(
          (failure) => emit(HomeFailure(errMessage: failure.errMessage)),
          (transactions) => emit(HomeSuccess(transactions: transactions)));
  }

}

