import 'dart:io';

import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:meta_weather/meta_weather.dart';

import 'meta_weather_test.mocks.dart';

// MockClasses
@GenerateMocks([http.Client])
void main() {
  group('Meta Weather API', () {
    const _baseUrl = 'www.metaweather.com';
    late MockClient httpClient;
    late WeatherApiClient metaWeatherApiClient;

    setUp(() {
      httpClient = MockClient();
      metaWeatherApiClient = WeatherApiClient(httpClient: httpClient);
    });
    group('Location', () {
      test('Check get location query request', () async {
        const city = 'Mock-City';

        when(httpClient.get(any))
            .thenAnswer((_) async => http.Response('[]', 200));

        await metaWeatherApiClient.getLocatioByQuery(city);
        verify(httpClient.get(
                Uri.https(_baseUrl, '/api/location/search', {'query': city})))
            .called(1);
      });

      test('Check get location lattLong request', () async {
        const latitude = -23.4493288;
        const longitude = -46.7161167;

        when(httpClient.get(any)).thenAnswer((_) async {
          return http.Response('[]', 200);
        });

        await metaWeatherApiClient.getLocatioByLattLong(
            lattitude: latitude, longitude: longitude);
        verify(httpClient.get(Uri.https(_baseUrl, '/api/location/search',
            {'lattlong': '$latitude,$longitude'}))).called(1);
      });
      test('Location Object parse test', () async {
        when(httpClient.get(any)).thenAnswer((_) async => http.Response(
            '''[{
            "title":"São Paulo",
            "location_type":"City",
            "woeid":455827,
            "latt_long":"-23.562880,-46.654659"}]''',
            200,
            headers: {'content-type': 'application/json; charset=utf-8'}));

        expect(
            await metaWeatherApiClient.getLocatioByQuery('são'),
            isA<List<Location>>()
                .having((location) => location[0].title, 'title', 'São Paulo')
                .having((location) => location[0].locationType, 'locationType',
                    LocationType.city)
                .having((location) => location[0].woeid, 'woeid', 455827)
                .having((location) => location[0].lattLong.latitude, 'Latitude',
                    -23.562880)
                .having((location) => location[0].lattLong.longitude,
                    'Logitude', -46.654659));
      });
    });
    group('Weather', () {
      test('Check Fetch Meta Weather Query', () async {
        const woeid = 455827;

        when(httpClient.get(any))
            .thenAnswer((_) async => http.Response('{}', 200));

        expect(() async => await metaWeatherApiClient.fetchWeather(woeid),
            throwsA(isA<HttpException>()));

        verify(httpClient.get(Uri.https(
          _baseUrl,
          '/api/location/$woeid',
        ))).called(1);
      });

      test('Weather Object parse test', () async {
        const woeid = 455827;

        when(httpClient.get(any)).thenAnswer((_) async => http.Response(
            '''
            {
              "consolidated_weather": [
                {
                "id": 5289394178097152,
                "weather_state_name": "Heavy Rain",
                "weather_state_abbr": "hr",
                "wind_direction_compass": "S",
                "created": "2021-04-18T18:42:04.557554Z",
                "applicable_date": "2021-04-18",
                "min_temp": 16.729999999999997,
                "max_temp": 22.759999999999998,
                "the_temp": 23.295,
                "wind_speed": 5.576062206439726,
                "wind_direction": 188.7168721342731,
                "air_pressure": 1016,
                "humidity": 83,
                "visibility": 7.582281973276068,
                "predictability": 77
                },
                {
                "id": 6487239887421440,
                "weather_state_name": "Light Rain",
                "weather_state_abbr": "lr",
                "wind_direction_compass": "S",
                "created": "2021-04-18T18:42:07.704962Z",
                "applicable_date": "2021-04-19",
                "min_temp": 16.18,
                "max_temp": 21.83,
                "the_temp": 22.57,
                "wind_speed": 7.058411480007423,
                "wind_direction": 181.07356968464407,
                "air_pressure": 1016.5,
                "humidity": 78,
                "visibility": 8.79178099896604,
                "predictability": 75
                },
                {
                "id": 6077985405796352,
                "weather_state_name": "Light Rain",
                "weather_state_abbr": "lr",
                "wind_direction_compass": "SSE",
                "created": "2021-04-18T18:42:10.678344Z",
                "applicable_date": "2021-04-20",
                "min_temp": 16.115000000000002,
                "max_temp": 22.215,
                "the_temp": 23.009999999999998,
                "wind_speed": 6.81593834667409,
                "wind_direction": 167.98033686877585,
                "air_pressure": 1017.5,
                "humidity": 72,
                "visibility": 9.305654974946314,
                "predictability": 75
                },
                {
                "id": 6437199592554496,
                "weather_state_name": "Light Rain",
                "weather_state_abbr": "lr",
                "wind_direction_compass": "SSE",
                "created": "2021-04-18T18:42:13.516270Z",
                "applicable_date": "2021-04-21",
                "min_temp": 15.370000000000001,
                "max_temp": 22.305,
                "the_temp": 22.465,
                "wind_speed": 6.033778541313396,
                "wind_direction": 157.83306270093436,
                "air_pressure": 1017,
                "humidity": 74,
                "visibility": 9.043747017418276,
                "predictability": 75
                },
                {
                "id": 4722278106398720,
                "weather_state_name": "Light Cloud",
                "weather_state_abbr": "lc",
                "wind_direction_compass": "S",
                "created": "2021-04-18T18:42:16.681948Z",
                "applicable_date": "2021-04-22",
                "min_temp": 15.33,
                "max_temp": 23.415,
                "the_temp": 23.355,
                "wind_speed": 5.602903727850685,
                "wind_direction": 169.0294986406132,
                "air_pressure": 1017,
                "humidity": 68,
                "visibility": 10.514843315040165,
                "predictability": 70
                },
                {
                "id": 6316889824296960,
                "weather_state_name": "Light Cloud",
                "weather_state_abbr": "lc",
                "wind_direction_compass": "SSE",
                "created": "2021-04-18T18:42:19.921226Z",
                "applicable_date": "2021-04-23",
                "min_temp": 15.059999999999999,
                "max_temp": 24.445,
                "the_temp": 23.32,
                "wind_speed": 3.7878813727829477,
                "wind_direction": 155,
                "air_pressure": 1017,
                "humidity": 57,
                "visibility": 9.999726596675416,
                "predictability": 70
                }
              ],
              "time": "2021-04-18T16:57:17.985948-03:00",
              "sun_rise": "2021-04-18T06:21:36.947521-03:00",
              "sun_set": "2021-04-18T17:49:51.698893-03:00",
              "timezone_name": "LMT",
              "parent": {
              "title": "Brazil",
              "location_type": "Country",
              "woeid": 23424768,
              "latt_long": "-14.242920,-54.387829"
              },
              "sources": [
                {
                "title": "BBC",
                "slug": "bbc",
                "url": "http://www.bbc.co.uk/weather/",
                "crawl_rate": 360
                },
                {
                "title": "Forecast.io",
                "slug": "forecast-io",
                "url": "http://forecast.io/",
                "crawl_rate": 480
                },
                {
                "title": "Met Office",
                "slug": "met-office",
                "url": "http://www.metoffice.gov.uk/",
                "crawl_rate": 180
                },
                {
                "title": "OpenWeatherMap",
                "slug": "openweathermap",
                "url": "http://openweathermap.org/",
                "crawl_rate": 360
                },
                {
                "title": "World Weather Online",
                "slug": "world-weather-online",
                "url": "http://www.worldweatheronline.com/",
                "crawl_rate": 360
                }
              ],
              "title": "São Paulo",
              "location_type": "City",
              "woeid": 455827,
              "latt_long": "-23.562880,-46.654659",
              "timezone": "America/Sao_Paulo"
              }''',
            200,
            headers: {'content-type': 'application/json; charset=utf-8'}));

        expect(
            await metaWeatherApiClient.fetchWeather(woeid),
            isA<Weather>()
                .having((weather) => weather.consolidatedWeather[0].condition,
                    'Object condition', WeatherCondition.heavyRain)
                .having((weather) => weather.title, 'City name', 'São Paulo')
                .having((weather) => weather.consolidatedWeather[0].temp,
                    'Current temp', 23.295)
                .having((weather) => weather.woeid, 'Woeid', woeid));
      });
    });
  });
}
