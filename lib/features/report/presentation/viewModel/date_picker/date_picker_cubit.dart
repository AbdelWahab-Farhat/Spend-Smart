import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'date_picker_state.dart';

class DatePickerCubit extends Cubit<DatePickerState> {
  DatePickerCubit() : super(DatePickerInitial());
  int currentYearPicked = DateTime.now().year;
  int currentMonthPicked = DateTime.now().month;
  void changeCurrentYear(int yearPicked) {
    currentYearPicked = yearPicked;
    emit(DatePickerChanged());
  }
  void changeCurrentMonth(int month) {
    currentMonthPicked = month;
    emit(DatePickerChanged());
  }
  void yearDown() {
    int currentYear = currentYearPicked;
    currentYear-=1;
    changeCurrentYear(currentYear);
  }
  void yearUp(){
    int currentYear = currentYearPicked;
    currentYear+=1;
    if (currentYear > DateTime.now().year) {
      return;
    }
    changeCurrentYear(currentYear);
  }
}
