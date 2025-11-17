import 'package:flutter/material.dart';
import '../products/product_create_page.dart';
import '../../../core/constants/strings.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.adminTitle)),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.add_box_outlined),
            title: const Text(AppStrings.productCreateTitle),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ProductCreatePage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
