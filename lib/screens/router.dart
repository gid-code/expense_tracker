import 'package:expense_tracker/screens/auth/auth_shell.dart';
import 'package:expense_tracker/screens/auth/splash_screen.dart';
import 'package:expense_tracker/screens/home/dashboard_screen.dart';
import 'package:expense_tracker/screens/home/expenses_screen.dart';
import 'package:expense_tracker/screens/home/home_shell.dart';
import 'package:expense_tracker/screens/home/settings/appearance_screen.dart';
import 'package:expense_tracker/screens/home/settings/settings_screen.dart';
import 'package:expense_tracker/screens/home/settings/account_information_screen.dart'; // Add this import
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:expense_tracker/screens/auth/login_screen.dart';  
import 'package:expense_tracker/screens/auth/signup_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return AuthShell(child: child);
      },
      routes: [
        GoRoute(
          path: '/login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginScreen();
          },
        ),
        GoRoute(
          path: '/signup',
          builder: (BuildContext context, GoRouterState state) {
            return const SignupScreen();
          },
        ),
      ],
    ),
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return HomeShell(child: child);
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/dashboard',
          builder: (BuildContext context, GoRouterState state) {
            return const DashboardScreen();
          },
        ),
        GoRoute(
          path: '/expenses',
          builder: (BuildContext context, GoRouterState state) {
            return const ExpensesScreen();
          },
        ),
        GoRoute(
          path: '/settings',
          builder: (BuildContext context, GoRouterState state) {
            return const SettingsScreen();
          },
          routes: [
            GoRoute(
              path: 'account-information',
              builder: (BuildContext context, GoRouterState state) {
                return const AccountInformationScreen();
              },
            ),
            GoRoute(
              path: 'appearance',
              builder: (BuildContext context, GoRouterState state) {
                return const AppearanceScreen();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);