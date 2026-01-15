import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/weather_repository.dart';
import '../../data/models/weather_model.dart';
import '../../../../core/di/service_locator.dart';

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  return getIt<WeatherRepository>();
});

final currentWeatherProvider = FutureProvider.autoDispose<WeatherModel>((ref) async {
  final repository = ref.watch(weatherRepositoryProvider);
  return await repository.getCurrentWeather();
});
