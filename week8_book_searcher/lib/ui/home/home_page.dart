import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week8_book_searcher/ui/home/home_view_model.dart';
import 'package:week8_book_searcher/ui/home/widgets/home_bottom_sheet.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void onSearch(String text) {
    // TODO: 홈뷰모델의 searchBooks 메서드 호출
    print('onSearch 호출됨 $text');
    ref.read(homeViewModelProvider.notifier).searchPlaces();
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeViewModelProvider);

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
        body: GridView.builder(
          padding: EdgeInsets.all(20),
          itemCount: homeState.places.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final place = homeState.places[index];

            return GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return HomeBottomSheet(place: place);
                  },
                );
              },
              child: Container(
                color: Colors.deepPurpleAccent.shade100,
                child: Text(place.placeName),
              ),
            );
          },
        ),
      ),
    );
  }
}
