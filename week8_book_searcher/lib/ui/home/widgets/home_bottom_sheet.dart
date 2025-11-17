import 'package:flutter/material.dart';
import 'package:week8_book_searcher/data/model/place.dart';
import 'package:week8_book_searcher/ui/detail/detail_page.dart';

class HomeBottomSheet extends StatelessWidget {
  final Place place;

  const HomeBottomSheet({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      padding: EdgeInsets.fromLTRB(20, 20, 20, 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            place.placeName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(place.distance, style: TextStyle(fontSize: 14)),
          Text(place.addressName, style: TextStyle(fontSize: 14)),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailPage(place: place);
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
    );
  }
}
