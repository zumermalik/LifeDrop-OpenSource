import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/welcome_screen.dart';

void main() {
  // Wrapping the app in ProviderScope is required for Riverpod state management
  runApp(const ProviderScope(child: LifeDropApp()));
}

class LifeDropApp extends StatelessWidget {
  const LifeDropApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LifeDrop',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme, // Applying your dark coral theme globally
      home: const WelcomeScreen(), // Setting the initial screen
    );
  }
}