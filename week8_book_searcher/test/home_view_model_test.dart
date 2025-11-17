import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:week8_book_searcher/data/repository/place_repository.dart';
import 'package:week8_book_searcher/ui/home/home_view_model.dart';

void main() {
  late ProviderContainer providerContainer;
  late MockClient mockClient;

  setUp(() {
    dotenv.testLoad(
      fileInput: '''
API_URL=https://example.org/data.json
AUTHORIZATION=Bearer test
''',
    );

    mockClient = MockClient((request) async {
      final mockResponse = jsonEncode({
        'documents': [
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
            "y": "37.56255453417897",
          },
        ],
      });
      return http.Response(
        mockResponse,
        200,
        headers: {'content-type': 'application/json'},
      );
    });
    final placeRepository = PlaceRepository(client: mockClient);
    providerContainer = ProviderContainer(
      overrides: [
        homeViewModelProvider.overrideWith(
          () => HomeViewModel(placeRepository: placeRepository),
        ),
      ],
    );
  });
  tearDown(() {
    mockClient.close();
    providerContainer.dispose();
  });

  test('HomeViewModel test', () async {
    addTearDown(providerContainer.dispose);
    final homeVm = providerContainer.read(homeViewModelProvider.notifier);

    final firstState = providerContainer.read(homeViewModelProvider);
    expect(firstState.places.isEmpty, true);

    await homeVm.searchPlaces();
    final afterState = providerContainer.read(homeViewModelProvider);
    expect(afterState.places.isEmpty, false);

    afterState.places.forEach((place) {
      print(place.toJson());
    });
  });
}
