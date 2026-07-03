import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gunshop_wallet/firebase_options.dart';
import 'package:gunshop_wallet/screens/auth/login_page.dart';
import 'package:gunshop_wallet/screens/home/home_page.dart';
import 'package:gunshop_wallet/screens/splash/splash_page.dart';
import 'package:gunshop_wallet/screens/topup/topup_page.dart';
import 'package:gunshop_wallet/screens/transaction/transaction_page.dart';
import 'package:gunshop_wallet/utils/app_colors.dart';
import 'package:gunshop_wallet/utils/constants.dart';
import 'package:gunshop_wallet/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const GunshopWallet());
}

class GunshopWallet extends StatelessWidget {
  const GunshopWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,

        scaffoldBackgroundColor: AppColors.background,

        colorScheme: ColorScheme.dark(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          surface: AppColors.surface,
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          centerTitle: true,
          elevation: 0,
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.surface,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),

      initialRoute: AppRoutes.splash,

      routes: {
        AppRoutes.splash: (_) => const SplashPage(),
        AppRoutes.login: (_) => const LoginPage(),
        AppRoutes.home: (_) => const HomePage(),
        AppRoutes.topup: (_) => const TopupPage(),
        AppRoutes.transaction: (_) => const TransactionPage(),
      },
    );
  }
}
