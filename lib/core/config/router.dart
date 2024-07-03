import 'package:go_router/go_router.dart';

import '../../features/expense/models/expense.dart';
import '../../features/expense/pages/expense_add_page.dart';
import '../../features/expense/pages/expense_edit_page.dart';
import '../../features/splash/splash_page.dart';
import '../../features/splash/onboard_page.dart';
import '../../features/splash/user_page.dart';
import '../../features/home/pages/home_page.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/onboard',
      builder: (context, state) => const OnboardPage(),
    ),
    GoRoute(
      path: '/user',
      builder: (context, state) => const UserPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/expense',
      builder: (context, state) => ExpenseAddPage(
        expense: state.extra as bool,
      ),
    ),
    GoRoute(
      path: '/expense-edit',
      builder: (context, state) => ExpenseEditPage(
        expense: state.extra as Expense,
      ),
    ),
  ],
);
