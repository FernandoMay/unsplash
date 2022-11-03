import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:unsplash/entity/models.dart';

const String baseUrl = "api.unsplash.com";
Client client = Client();
const String clientkey = "Q_Zh37w8WNeExHTOvI6Lay_EWtr4Pbe4kjmXDsd4Y9A";

Future<SearchPhotos> getResults(String query, int page) async {
  final response = await client.get(
    Uri.https(baseUrl,
        "/search/photos?page=${page.toString()}&query=$query&client_id=$clientkey"),
    headers: {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept': '*/*'
    },
  );
  if (response.statusCode == 200) {
    final body = json.decode(response.body);
    var data = SearchPhotos.fromJson(body);
    return data;
  } else {
    throw Exception('Failed to load data from API ${response.statusCode}');
  }
}

Future<bool> createResult(Result data) async {
  final response = await client.post(
      Uri.https(
        baseUrl,
        "/api/Results",
      ),
      headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*'
      },
      body: json.encode(data.toJson()));
  if (response.statusCode == 200) {
    return true;
  } else {
    throw Exception('Failed ${response.reasonPhrase}');
  }
}

Future<bool> updateResult(Result data) async {
  final response = await client.patch(
      Uri.https(
        baseUrl,
        "/api/Results/${data.id}",
      ),
      headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*'
      },
      body: json.encode(data.toJson()));
  if (response.statusCode == 200) {
    return true;
  } else {
    throw Exception('Failed ${response.reasonPhrase}');
  }
}

Future<bool> deleteResult(int id) async {
  final response = await client.delete(
    Uri.https(
      baseUrl,
      "/api/Results/$id",
    ),
    headers: {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept': '*/*'
    },
  );
  if (response.statusCode == 200) {
    return true;
  } else {
    throw Exception('Failed ${response.reasonPhrase}');
  }
}
