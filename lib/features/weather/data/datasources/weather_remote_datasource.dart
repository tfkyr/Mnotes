import 'package:dio/dio.dart';
import '../models/weather_model.dart';
import '../../../../core/di/service_locator.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeather(double lat, double lng);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final Dio dio = getIt<Dio>();

  @override
  Future<WeatherModel> getWeather(double lat, double lng) async {
    try {
      final response = await dio.get(
        'https://api.open-meteo.com/v1/forecast',
        queryParameters: {
          'latitude': lat,
          'longitude': lng,
          'current_weather': true,
        },
      );
      return WeatherModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load weather: $e');
    }
  }
}
