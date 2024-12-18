import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/app_provider.dart';

class AppearanceScreen extends StatelessWidget {
  const AppearanceScreen({super.key});

  InkWell buildThemeItem(AppProvider appProvider, BuildContext context, ThemeMode themeMode) {
    var selectedBackground = Theme.of(context).colorScheme.primaryContainer;
    var unSelectedBackground = Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.8);
    var selectedBorder = Theme.of(context).colorScheme.primary;
    var unSelectedBorder = Theme.of(context).colorScheme.secondary.withOpacity(0.4);
    return InkWell(
      onTap: (){
        appProvider.setThemeMode(themeMode);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: appProvider.themeMode == themeMode? selectedBackground : unSelectedBackground,
          border: Border.all(
            color: appProvider.themeMode == themeMode? selectedBorder : unSelectedBorder
          )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
          child: Text(themeMode.name.toUpperCase()),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appearance'),
      ),
      body: Consumer<AppProvider>(
        builder: (context, appProvider, child) {
          
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: ThemeMode.values.map((e){
                return buildThemeItem(appProvider, context, e);
              }).toList()
              ,
            ),
          );
        },
      ),
    );
  }
}