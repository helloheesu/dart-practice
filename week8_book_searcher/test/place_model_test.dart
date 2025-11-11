import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:week8_book_searcher/data/model/place.dart';

void main() {
  test('Place model - fromJson()', () {
    String dummyData = """
{
  "address_name": "서울 중구 명동2가 25-36",
  "category_group_code": "FD6",
  "category_group_name": "음식점",
  "category_name": "음식점 > 분식",
  "distance": "",
  "id": "10332413",
  "phone": "02-776-5348",
  "place_name": "명동교자 본점",
  "place_url": "http://place.map.kakao.com/10332413",
  "road_address_name": "서울 중구 명동10길 29",
  "x": "126.98561429978552",
  "y": "37.56255453417897"
}
""";

    Map<String, dynamic> map = jsonDecode(dummyData);
    Place place = Place.fromJson(map);

    expect(place.categoryGroupName, "음식점");
    expect(place.id, 10332413);
  });
  test('Place model - toJson()', () {
    String dummyData = """
{
  "address_name": "서울 중구 명동2가 25-36",
  "category_group_code": "FD6",
  "category_group_name": "음식점",
  "category_name": "음식점 > 분식",
  "distance": "",
  "id": "10332413",
  "phone": "02-776-5348",
  "place_name": "명동교자 본점",
  "place_url": "http://place.map.kakao.com/10332413",
  "road_address_name": "서울 중구 명동10길 29",
  "x": "126.98561429978552",
  "y": "37.56255453417897"
}
""";

    Map<String, dynamic> map = jsonDecode(dummyData);
    Place place = Place.fromJson(map);
    Map<String, dynamic> json = place.toJson();

    expect(json['x'], "126.98561429978552");
  });
}
