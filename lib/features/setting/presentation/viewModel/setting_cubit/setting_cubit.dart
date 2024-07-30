import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spend_smart/core/models/user.dart';

import '../../../data/repo/setting_repo/setting_repo.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  final SettingRepo settingRepo;
  SettingCubit(this.settingRepo) : super(SettingInitial());


  Future<void> fetchUser() async {
    emit(SettingLoading());
    var result = await settingRepo.fetchUser();
    result.fold((l) => emit(SettingFailure(errMessage: l.errMessage)), (r) => emit(SettingSuccess(user: r)),);
  }


}
