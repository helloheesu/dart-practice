import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week8_book_searcher/data/model/place.dart';
import 'package:week8_book_searcher/data/repository/place_repository.dart';

class HomeState {
  List<Place> places;
  HomeState(this.places);
}

class HomeViewModel extends Notifier<HomeState> {
  HomeViewModel({PlaceRepository? placeRepository})
    : _placeRepository = placeRepository ?? PlaceRepository();

  final PlaceRepository _placeRepository;

  @override
  HomeState build() {
    return HomeState([]);
  }

  // repository.searchPlaces() 에, 강의와 다르게 query 인자를 안 넣었으므로 이 함수에서도 인자 없음
  Future<void> searchPlaces() async {
    final places = await _placeRepository.searchPlaces();
    state = HomeState(places);
  }
}

final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});
