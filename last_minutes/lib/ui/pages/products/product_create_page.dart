import 'package:flutter/material.dart';
import '../../../data/model/product.dart';
import '../../../data/model/product_category.dart';
import '../../../data/repository/product_repository_mock.dart';

class ProductCreatePage extends StatefulWidget {
  const ProductCreatePage({super.key});

  @override
  State<ProductCreatePage> createState() => _ProductCreatePageState();
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _minutes = TextEditingController();
  final _subtitle = TextEditingController();
  ProductCategory _category = ProductCategory.takeFive;
  bool _premium = false;
  final _repo = ProductRepositoryMock();

  @override
  void dispose() {
    _title.dispose();
    _minutes.dispose();
    _subtitle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('상품 등록')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _title,
              decoration: const InputDecoration(labelText: '제목'),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? '제목을 입력하세요' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _subtitle,
              decoration: const InputDecoration(labelText: '서브텍스트(선택)'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _minutes,
              decoration: const InputDecoration(labelText: '소요 시간(분)'),
              keyboardType: TextInputType.number,
              validator: (v) {
                final value = int.tryParse(v ?? '');
                if (value == null || value <= 0) return '정확한 분(min)을 입력하세요';
                return null;
              },
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<ProductCategory>(
              value: _category,
              decoration: const InputDecoration(labelText: '카테고리'),
              items: [
                for (final c in ProductCategory.values)
                  DropdownMenuItem(value: c, child: Text(c.label)),
              ],
              onChanged: (v) => setState(() => _category = v ?? _category),
            ),
            const SizedBox(height: 12),
            SwitchListTile(
              title: const Text('프리미엄 상품'),
              value: _premium,
              onChanged: (v) => setState(() => _premium = v),
            ),
            const SizedBox(height: 20),
            FilledButton(onPressed: _submit, child: const Text('등록')),
          ],
        ),
      ),
    );
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final minutes = int.parse(_minutes.text.trim());
    final product = Product(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: _title.text.trim(),
      minutes: minutes,
      category: _category,
      premium: _premium,
      subtitle: _subtitle.text.trim().isEmpty ? null : _subtitle.text.trim(),
    );
    _repo.add(product);
    if (mounted) {
      Navigator.of(context).pop(true); // return flag to refresh
    }
  }
}
