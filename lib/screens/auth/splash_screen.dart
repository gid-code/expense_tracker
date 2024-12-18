import 'package:expense_tracker/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final LocalAuthentication auth = LocalAuthentication();

  @override
  void initState() {
    super.initState();
    _checkAuthAndNavigate();
  }

  _checkAuthAndNavigate() async {
    await Future.delayed(const Duration(seconds: 2));
    // if (!mounted) return;
    // context.go('/dashboard');

    final appProvider = Provider.of<AppProvider>(context, listen: false);
    await appProvider.loadToken();

    if (appProvider.token != null) {
      if (appProvider.isBiometricEnabled) {
        bool canCheckBiometrics = await auth.canCheckBiometrics;
        bool isDeviceSupported = await auth.isDeviceSupported();
        List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();
        
        if (canCheckBiometrics && isDeviceSupported && availableBiometrics.isNotEmpty) {
          bool didAuthenticate = await auth.authenticate(
            localizedReason: 'Please authenticate to access the dashboard',
            options: const AuthenticationOptions(
              useErrorDialogs: true,
              stickyAuth: true,
            ),
          );

          if (didAuthenticate) {
            if (!mounted) return;
            context.go('/dashboard');
          } else {
            // Handle authentication failure
            if (!mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Biometric authentication failed')),
            );
          }
        } else {
          // Biometric authentication is not available
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Biometric authentication is not available')),
          );
          context.go('/dashboard');
        }
      } else {
        if (!mounted) return;
        context.go('/dashboard');
      }
    } else {
      // No token, go to login
      if (!mounted) return;
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Text(
          'SpendWise',
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}