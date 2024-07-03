import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:project5/features/home/widgets/news_list.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/custom/custom_scaffold.dart';
import '../../activities/pages/activities_page.dart';
import '../../expense/bloc/expense_bloc.dart';
import '../bloc/home_bloc.dart';
import '../widgets/expense_add_button.dart';
import '../widgets/expense_data.dart';
import '../widgets/expenses_list.dart';
import '../widgets/nav_bar.dart';
import '../widgets/no_data.dart';
import '../widgets/tab_card.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeSettings) return const SettingsPage();

                if (state is HomeActivities) return const ActivitiesPage();

                return const _Home();
              },
            ),
            const NavBar(),
          ],
        ),
      ),
    );
  }
}

class _Home extends StatefulWidget {
  const _Home();

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  bool history = true;

  void changeTab() {
    setState(() {
      history = !history;
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<ExpenseBloc>().add(GetExpensesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 6),
          Text(
            'Good to see you!',
            style: TextStyle(
              color: AppColors.white50,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            userName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 11),
          Row(
            children: [
              const SizedBox(width: 20),
              Text(
                'Your balance per ($userCurrency)',
                style: TextStyle(
                  color: AppColors.white50,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          BlocBuilder<ExpenseBloc, ExpenseState>(
            builder: (context, state) {
              return Row(
                children: [
                  const SizedBox(width: 20),
                  Container(
                    height: 78,
                    width: 182,
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        '${userIncome - userExpense}$userCurrency',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 38,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  ExpenseData(
                    expence: true,
                    number: userExpense,
                  ),
                  const SizedBox(width: 12),
                  ExpenseData(
                    expence: false,
                    number: userIncome,
                  ),
                  const SizedBox(width: 20),
                ],
              );
            },
          ),
          const SizedBox(height: 11),
          Row(
            children: [
              const SizedBox(width: 20),
              Text(
                'Add options',
                style: TextStyle(
                  color: AppColors.white50,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const SizedBox(width: 15),
              ExpenseAddButton(
                title: 'Income',
                onPressed: () {
                  context.push('/expense', extra: false);
                },
              ),
              const SizedBox(width: 15),
              ExpenseAddButton(
                title: 'Expense',
                onPressed: () {
                  context.push('/expense', extra: true);
                },
              ),
              const SizedBox(width: 15),
            ],
          ),
          const SizedBox(height: 13),
          Container(
            height: 1,
            margin: const EdgeInsets.symmetric(horizontal: 35),
            color: AppColors.white50,
          ),
          const SizedBox(height: 13),
          Row(
            children: [
              const SizedBox(width: 18),
              TabCard(
                title: 'History',
                selected: history,
                onPressed: changeTab,
              ),
              const SizedBox(width: 8),
              TabCard(
                title: 'News',
                selected: !history,
                onPressed: changeTab,
              ),
            ],
          ),
          const SizedBox(height: 10),
          BlocBuilder<ExpenseBloc, ExpenseState>(
            builder: (context, state) {
              if (state is ExpensesLoadedState) {
                if (state.expenses.isEmpty) return const NoData();

                if (history) return ExpensesList(expenses: state.expenses);

                return const NewsList();
              }

              return Container();
            },
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
