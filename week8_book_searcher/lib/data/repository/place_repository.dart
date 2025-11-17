import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:week8_book_searcher/data/model/place.dart';

class PlaceRepository {
  PlaceRepository({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  Future<List<Place>> searchPlaces() async {
    final url = dotenv.env['API_URL'] ?? '';
    final authorization = dotenv.env['AUTHORIZATION'] ?? '';

    final headers = {'Authorization': authorization};

    final http.Response response;
    try {
      response = await _client.get(Uri.parse(url), headers: headers);
    } catch (e) {
      print("http request error: $e");
      return [];
    }

    if (response.statusCode != 200) {
      return [];
    }

    Map<String, dynamic> map;
    try {
      map = jsonDecode(response.body);
    } catch (e) {
      print("json decode error: $e");
      return [];
    }
    final documents = List.from(map['documents']);
    List<Place> places = documents.map((doc) => Place.fromJson(doc)).toList();

    return places;
  }
}
