import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void onSearch(String text) {
    print('onSearch 호출됨 $text');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                onSearch(_searchController.text);
              },
              child: Container(
                width: 50,
                height: 50,
                // Container에 배경색이 없으면 자녀위젯에만 터치 이벤트가 적용됨
                color: Colors.transparent,
                child: Icon(Icons.search),
              ),
            ),
          ],
          title: TextField(
            maxLines: 1,
            onSubmitted: onSearch,
            controller: _searchController,
            decoration: InputDecoration(
              hintText: '검색어를 입력해 주세요',
              isDense: true,
              border: WidgetStateInputBorder.resolveWith((states) {
                if (states.contains(WidgetState.focused)) {
                  return OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue),
                  );
                }

                return OutlineInputBorder();
              }),
            ),
          ),
        ),
        body: Center(child: const Text('Home Page')),
      ),
    );
  }
}
