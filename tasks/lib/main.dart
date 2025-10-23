import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'constants.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appTitle,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.amber),
      home: const HomePage(),
    );
  }
}
