import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spend_smart/core/enums/transaction_enum.dart';

part 'transaction_state.dart';


// only the data will save here.
class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());
   TransactionEnum? transactionType;
}
