import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../models/expense.dart';
import '../service/expense_service.dart';

part 'expense_event.dart';
part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final _service = ExpenseService();
  List<Expense> _expenses = [];

  ExpenseBloc() : super(ExpenseInitial()) {
    on<GetExpensesEvent>((event, emit) async {
      if (_service.expenses.isEmpty) {
        _expenses = await _service.getExpenses();
        getExpenses(_expenses);
        emit(ExpensesLoadedState(expenses: _expenses));
      } else {
        getExpenses(_expenses);
        emit(ExpensesLoadedState(expenses: _expenses));
      }
    });

    on<AddExpenseEvent>((event, emit) async {
      _service.expenses.add(event.expense);
      _expenses = await _service.updateExpenses();
      getExpenses(_expenses);
      emit(ExpensesLoadedState(expenses: _expenses));
    });

    on<EditExpenseEvent>((event, emit) async {
      for (Expense expense in _service.expenses) {
        if (expense.id == event.expense.id) {
          expense.target = event.expense.target;
          expense.amount = event.expense.amount;
          expense.category = event.expense.category;
          expense.expense = event.expense.expense;
        }
      }
      _expenses = await _service.updateExpenses();
      getExpenses(_expenses);
      emit(ExpensesLoadedState(expenses: _expenses));
    });

    on<DeleteExpenseEvent>((event, emit) async {
      _service.expenses.removeWhere((element) => element.id == event.id);
      _expenses = await _service.updateExpenses();
      getExpenses(_expenses);
      emit(ExpensesLoadedState(expenses: _expenses));
    });
  }
}
