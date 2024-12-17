import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/app_provider.dart';

class AppearanceScreen extends StatelessWidget {
  const AppearanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appearance'),
      ),
      body: Consumer<AppProvider>(
        builder: (context, appProvider, child) {
          var selectedBackground = Theme.of(context).colorScheme.primaryContainer;
          var unSelectedBackground = Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.8);
          var selectedBorder = Theme.of(context).colorScheme.primary;
          var unSelectedBorder = Theme.of(context).colorScheme.secondary.withOpacity(0.4);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: appProvider.themeMode == ThemeMode.dark? selectedBackground : unSelectedBackground,
                    border: Border.all(
                      color: appProvider.themeMode == ThemeMode.dark? selectedBorder : unSelectedBorder
                    )
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                    child: Text("DARK"),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: appProvider.themeMode == ThemeMode.light? selectedBackground : unSelectedBackground,
                    border: Border.all(
                      color: appProvider.themeMode == ThemeMode.light? selectedBorder : unSelectedBorder
                    )
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                    child: Text("LIGHT"),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: appProvider.themeMode == ThemeMode.system? selectedBackground : unSelectedBackground,
                    border: Border.all(
                      color: appProvider.themeMode == ThemeMode.system? selectedBorder : unSelectedBorder
                    )
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                    child: Text("SYSTEM"),
                  ),
                )
              ]
                // ListTile(
                //   title: const Text('Theme Mode'),
                //   trailing: DropdownButton<ThemeMode>(
                //     value: appProvider.themeMode,
                //     onChanged: (ThemeMode? newMode) {
                //       if (newMode != null) {
                //         appProvider.setThemeMode(newMode);
                //       }
                //     },
                //     items: const [
                //       DropdownMenuItem(
                //         value: ThemeMode.system,
                //         child: Text('System'),
                //       ),
                //       DropdownMenuItem(
                //         value: ThemeMode.light,
                //         child: Text('Light'),
                //       ),
                //       DropdownMenuItem(
                //         value: ThemeMode.dark,
                //         child: Text('Dark'),
                //       ),
                //     ],
                //   ),
                // ),
                // const Divider(),

              ,
            ),
          );
        },
      ),
    );
  }
}