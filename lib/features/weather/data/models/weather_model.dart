class WeatherModel {
  final double temperature;
  final double windSpeed;
  final int weatherCode;
  final int isDay;

  WeatherModel({
    required this.temperature,
    required this.windSpeed,
    required this.weatherCode,
    required this.isDay,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final current = json['current_weather'];
    return WeatherModel(
      temperature: (current['temperature'] as num).toDouble(),
      windSpeed: (current['windspeed'] as num).toDouble(),
      weatherCode: current['weathercode'] as int,
      isDay: current['is_day'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'current_weather': {
        'temperature': temperature,
        'windspeed': windSpeed,
        'weathercode': weatherCode,
        'is_day': isDay,
      }
    };
  }
}
