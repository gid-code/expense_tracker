import 'package:expense_tracker/providers/app_provider.dart';
import 'package:expense_tracker/screens/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expense_tracker/theme.dart';
import 'package:expense_tracker/util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final appProvider = AppProvider();
  // await appProvider.initializeApp();

  // runApp(
  //   ChangeNotifierProvider.value(
  //     value: appProvider,
  //     child: const MyApp(),
  //   ),
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(context)..initializeApp(),
      child: const MyAppContent(),
    );
  }
}

class MyAppContent extends StatelessWidget {
  const MyAppContent({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Inter", "Inter");
    MaterialTheme theme = MaterialTheme(textTheme);
    return Consumer<AppProvider>(
      builder: (context, appProvider, child) {
        return MaterialApp.router(
          title: 'Expense Tracker',
          theme: theme.light(),
          darkTheme: theme.dark(),
          themeMode: appProvider.themeMode,
          routerConfig: router,
        );
      },
    );
  }
}
