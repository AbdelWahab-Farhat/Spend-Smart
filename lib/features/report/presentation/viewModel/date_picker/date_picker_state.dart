part of 'date_picker_cubit.dart';

@immutable
sealed class DatePickerState {}

final class DatePickerInitial extends DatePickerState {}
final class DatePickerChanged extends DatePickerState {}
