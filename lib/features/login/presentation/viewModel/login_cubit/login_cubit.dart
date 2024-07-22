import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(LoginInitial());


  Future<void>loginAuth() async {
    emit(LoginLoading());
    var result = await loginRepo.userAuth();
    result.fold((failure) => emit(LoginFailure(errMessage: failure.errMessage)),
        (_) => emit(LoginSuccess()),);
  }
}
