import 'package:flutter_test/flutter_test.dart';
import 'package:week8_book_searcher/data/model/place.dart';
import 'package:week8_book_searcher/data/repository/place_repository.dart';

void main() {
  test('Place repository test', () async {
    PlaceRepository placeRepository = PlaceRepository();
    final List<Place> places = await placeRepository.searchPlaces();

    expect(places.isNotEmpty, true);
  });
}
