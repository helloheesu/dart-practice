import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../ui/pages/products/product_list_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '시간당',
      theme: buildAppTheme(),
      navigatorKey: navigatorKey,
      home: const ProductListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
