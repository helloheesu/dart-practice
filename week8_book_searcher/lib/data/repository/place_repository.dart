import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:week8_book_searcher/data/model/place.dart';

class PlaceRepository {
  Future<List<Place>> searchPlaces() async {
    final url = dotenv.env['API_URL'] ?? '';
    final authorization = dotenv.env['AUTHORIZATION'] ?? '';

    final client = Client();
    final headers = {'Authorization': authorization};

    final response = await client.get(Uri.parse(url), headers: headers);

    if (response.statusCode != 200) {
      return [];
    }

    Map<String, dynamic> map = jsonDecode(response.body);
    final documents = List.from(map['documents']);
    List<Place> places = documents.map((doc) => Place.fromJson(doc)).toList();

    return places;
  }
}
