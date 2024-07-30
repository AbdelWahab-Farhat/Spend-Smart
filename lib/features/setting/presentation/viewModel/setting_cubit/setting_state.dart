part of 'setting_cubit.dart';

@immutable
sealed class SettingState {}

final class SettingInitial extends SettingState {}
final class SettingLoading extends SettingState {}
final class SettingFailure extends SettingState {
  final String errMessage;

  SettingFailure({required this.errMessage});
}
final class SettingSuccess extends SettingState {
  final User user;

  SettingSuccess({required this.user});
}
