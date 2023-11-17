import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/api_services.dart';

final weatherProvider =
    FutureProvider<WeatherApp?>((ref) => ApiServices.getWeather());
