import 'package:flutter/material.dart';
import 'package:week8_book_searcher/ui/detail/detail_page.dart';

class HomeBottomSheet extends StatelessWidget {
  const HomeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      padding: EdgeInsets.fromLTRB(20, 20, 20, 50),
      child: Row(
        spacing: 20,
        children: [
          Image.network('https://picsum.photos/200/300', fit: BoxFit.cover),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '해리포터와 마법사의 돌',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text('J.K. 롤링', style: TextStyle(fontSize: 14)),
                Text('해리포터와 마법사의 돌을 찾아가는 여정', style: TextStyle(fontSize: 14)),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailPage();
                        },
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text(
                      "자세히 보기",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
