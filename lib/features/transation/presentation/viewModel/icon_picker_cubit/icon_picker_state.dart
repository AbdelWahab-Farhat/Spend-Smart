part of 'icon_picker_cubit.dart';

@immutable
sealed class IconPickerState {}

final class IconPickerInitial extends IconPickerState {}
final class IconPickerChanged extends IconPickerState {}

