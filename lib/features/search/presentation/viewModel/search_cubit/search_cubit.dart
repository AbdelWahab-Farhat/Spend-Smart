import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:spend_smart/core/enums/transaction_enum.dart';
import 'package:spend_smart/core/models/category/category.dart';

import '../../../../../core/models/transaction/transaction.dart';
import '../../../../../core/repo/core_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final CoreRepo coreRepo;
  final controllerSearch = TextEditingController();
  SearchCubit(this.coreRepo) : super(SearchInitial());
  List<Transaction>? transactions;



  Future<void> initUserTransactions() async {
    emit(SearchLoading());
    var result = await coreRepo.userTransaction();
    result.fold((l) => emit(SearchFailure(errMessage: l.errMessage)), (r) {
      transactions = r.where((element) => element.transactionType == TransactionEnum.expense,).toList();
      emit(SearchSuccess());
    },);
  }

  List<Transaction> transactionsByFilter(List<Category> categoriesFiltered) {
    List<Transaction> filteredCategories = [];
    if (categoriesFiltered.isEmpty) {
      return transactions!;
    }
    for(var item in transactions!) {
      bool isWithFilter = categoriesFiltered.any((element) => element.categoryName == item.category.categoryName,);
        if (isWithFilter) {
          filteredCategories.add(item);
        }
    }
    return filteredCategories;
  }
  void updateState(){
    emit(SearchSuccess());
  }

  List<Transaction> searchTransactionsByName(List<Transaction> transactions) {
    String searchQuery = controllerSearch.text.toLowerCase();
    if (searchQuery.isEmpty) {
      return transactions;
    }
    List<Transaction> filteredTransactions = transactions.where((transaction) {
      return transaction.description.toLowerCase().contains(searchQuery);
    }).toList();
    return filteredTransactions;
  }
}
