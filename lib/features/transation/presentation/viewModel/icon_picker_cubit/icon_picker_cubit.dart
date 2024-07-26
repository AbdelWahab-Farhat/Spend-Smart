import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/models/category/category.dart';
part 'icon_picker_state.dart';

class IconPickerCubit extends Cubit<IconPickerState> {
  IconPickerCubit() : super(IconPickerInitial());
  Category? newCategoryValue;



  void initNewCategoryValue(Category category){
    newCategoryValue = category;
    emit(IconPickerChanged());
  }
}
