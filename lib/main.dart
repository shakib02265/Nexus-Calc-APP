import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/currency_mode.dart';
import 'screens/settings_screen.dart';
import 'screens/splash_screen.dart';
void main() {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const NexusCalc());
}

class NexusCalc extends StatelessWidget {

  const NexusCalc({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: 'BASIC CALC',

      themeMode: ThemeMode.dark,

      theme: AppTheme.darkTheme,

      home: const SplashScreen(),

      builder: (context, child) {

        return ScrollConfiguration(

          behavior: const MaterialScrollBehavior().copyWith(
            overscroll: false,
          ),

          child: child!,
        );
      },
    );
  }
}