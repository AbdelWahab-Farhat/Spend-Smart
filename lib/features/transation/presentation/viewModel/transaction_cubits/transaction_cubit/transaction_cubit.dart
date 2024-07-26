import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:spend_smart/core/enums/transaction_enum.dart';
import 'package:spend_smart/core/models/transaction.dart';
import 'package:uuid/uuid.dart';
import '../../../../../../core/models/category/category.dart';
import '../../../../data/repo/transaction_repo/transaction_repo.dart';

part 'transaction_state.dart';


// only the data will save here.
class TransactionCubit extends Cubit<TransactionState> {
  final TransactionRepo transactionRepo;
  TransactionCubit(this.transactionRepo) : super(TransactionInitial());
   var formKey = GlobalKey<FormState>();
   TransactionEnum? transactionType;
   Category? category;
   double? amount;
   String? description;

  void initTransactionType(TransactionEnum  type){
    transactionType = type;
    emit(TransactionChanged());
  }
  void initCategory(Category  categoryData){
    category = categoryData;
    emit(TransactionChanged());
  }
  void initAmount(double  cashAmount){
    amount = cashAmount;
    emit(TransactionChanged());
  }
  void initDescription(String  des){
    description = des;
    emit(TransactionChanged());
  }

  Future<void> addNewTransaction() async {
    emit(TransactionLoading());
    var transaction = Transaction(
        ID: const Uuid().v6(),
        userID: FirebaseAuth.instance.currentUser!.uid,
        amount: amount ?? 0,
        category: category!,
        transactionDate: DateTime.now(),
        description: description ?? "",
        transactionType: transactionType ?? TransactionEnum.expense);
      var result = await transactionRepo.addNewTransaction(transaction);
      result.
      fold((failure) => emit(TransactionFailure(errMessage: failure.errMessage)),
          (_) => emit(TransactionSuccess(successMessage: 'Transaction Added Successfully')),);
  }
}

