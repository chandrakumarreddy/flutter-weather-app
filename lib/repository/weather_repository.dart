import 'dart:convert' as convert;
import 'package:get/get_connect.dart';
import 'package:http/http.dart' as http;
import 'package:weather_tracking/models/location_data.dart';
import 'package:weather_tracking/models/weathere_data.dart';

class WeatherRepository {
  Future<LocationData?> getCurrentLocation() async {
    LocationData? locationData;
    var url = Uri.http('ip-api.com', '/json');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      locationData = LocationData.fromJson(jsonResponse);
      return locationData;
    } else {
      return locationData;
    }
  }

  Future<WeatherData?> getWeatherForLocation(LocationData location) async {
    WeatherData? weather;
    // The parameters required by the API to give us what we need
    var params = {
      'lat': location.lat.toString(),
      'lon': location.lon.toString(),
      'city': location.regionName,
      'appId': '941a1d4f04f682080c1bc6dfb94eadb6',
    };
    var url = Uri.http('api.openweathermap.org', '/data/2.5/weather', params);
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(
      url,
    );
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      // We use the json decoded response and apply to our .fromJson function
      weather = WeatherData.fromJson(jsonResponse);
      return weather;
    } else {
      return weather;
    }
  }
}
