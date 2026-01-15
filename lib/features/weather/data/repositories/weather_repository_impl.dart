import '../../domain/repositories/weather_repository.dart';
import '../datasources/weather_remote_datasource.dart';
import '../datasources/location_datasource.dart';
import '../datasources/weather_local_datasource.dart';
import '../models/weather_model.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;
  final LocationDataSource locationDataSource;
  final WeatherLocalDataSource localDataSource;

  WeatherRepositoryImpl({
    required this.remoteDataSource,
    required this.locationDataSource,
    required this.localDataSource,
  });

  @override
  Future<WeatherModel> getCurrentWeather() async {
    try {
      final position = await locationDataSource.getCurrentPosition();
      final weather = await remoteDataSource.getWeather(position.latitude, position.longitude);
      localDataSource.cacheWeather(weather);
      return weather;
    } catch (e) {
      try {
        return await localDataSource.getLastWeather();
      } catch (cacheError) {
        throw e;
      }
    }
  }
}
