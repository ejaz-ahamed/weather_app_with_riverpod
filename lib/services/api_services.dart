import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/utils/api_url.dart';

class ApiServices {
  static final http.Client _client = http.Client();
  static Future<WeatherApp?> getWeather() async {
    final url = Uri.parse(AppUrl.baseUrl + AppUrl.postPath);
    try {
      http.Response response = await _client.get(url);
      if (response.statusCode == 200) {
        return weatherAppFromJson(response.body);
      }
      return null;
    } catch (e) {
      log("An error occured while executing Weather $e");
    }
    return null;
  }
}
