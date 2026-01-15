import '../entities/weather_entity.dart'; // Will create this next or use model if simple
import '../../data/models/weather_model.dart';

abstract class WeatherRepository {
  Future<WeatherModel> getCurrentWeather();
}
