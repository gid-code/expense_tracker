import 'package:expense_tracker/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:local_auth/local_auth.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> _checkBiometric() async {
    bool canCheckBiometrics = await auth.canCheckBiometrics;
    bool isDeviceSupported = await auth.isDeviceSupported();
    List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();

    return canCheckBiometrics && isDeviceSupported && availableBiometrics.isNotEmpty;
  }

  Future<void> _showEnrollInstructions() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Biometric Authentication'),
          content: const Text(
            'Biometric authentication is supported but not enrolled.\n\n'
            'To enroll, follow these steps:\n\n'
            'For Android:\n'
            '1. Go to Settings\n'
            '2. Select Security\n'
            '3. Select Fingerprint or Face Recognition\n'
            '4. Follow the on-screen instructions to enroll your biometrics\n\n'
            'For iOS:\n'
            '1. Go to Settings\n'
            '2. Select Face ID & Passcode or Touch ID & Passcode\n'
            '3. Follow the on-screen instructions to enroll your biometrics'
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Security'),
      ),
      body: Consumer<AppProvider>(
        builder: (context, appProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.fingerprint_rounded),
                        SizedBox(width: 8,),
                        Text("Enable Biometric")
                      ],
                    ),
                    Switch(
                      value: appProvider.isBiometricEnabled, 
                      onChanged: (e) async{
                        if (e) {
                          bool hasBiometric = await _checkBiometric();
                          if (hasBiometric) {
                            appProvider.toggleBiometric();
                          } else {
                            await _showEnrollInstructions();
                          }
                        } else {
                          appProvider.toggleBiometric();
                        }
                      }
                    )
                  ],
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
