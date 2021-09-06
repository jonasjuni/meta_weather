import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'models/models.dart';

class WeatherApiClient {
  final http.Client _httpClient;
  static const _baseUrl = 'www.metaweather.com';
  static const successCode = 200;

  WeatherApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<List<Location>> getLocatioId(String city) async {
    final url = Uri.https(
        _baseUrl, '/api/location/search', <String, dynamic>{'query': city});
    final List data = await _getParsedResonse(url);
    return data.map((e) => Location.fromJson(e)).toList();
  }

  Future<Weather> fetchWeather(int woeid) async {
    final url = Uri.https(_baseUrl, '/api/location/$woeid');
    final Map<String, dynamic> data = await _getParsedResonse(url);

    if (data.isEmpty) {
      throw HttpException('Weather not found', uri: url);
    }

    return Weather.fromJson(data);
  }

  Future<dynamic> _getParsedResonse(Uri url) async {
    try {
      final response = await _httpClient.get(url);
      if (response.statusCode == successCode) {
        return jsonDecode(utf8.decode(response.bodyBytes));
      } else {
        throw Exception('Error fetching: ${response.statusCode}');
      }
    } on SocketException catch (e) {
      throw SocketException('No internet',
          osError: e.osError, address: e.address, port: e.port);
    } on FormatException catch (e) {
      throw FormatException('Bad Response', e.source, e.offset);
    } catch (_) {
      rethrow;
    }
  }
}
