class Weather {
  double? humidity;
  int? precipitation;
  DateTime? sunriseTime;
  DateTime? sunsetTime;
  DateTime? startTime;
  int? temperature;
  int? weatherCode;
  double? windSpeed;

  Weather(
      {this.humidity,
      this.precipitation,
      this.sunriseTime,
      this.sunsetTime,
      this.startTime,
      this.temperature,
      this.weatherCode,
      this.windSpeed});

  Weather.fromJson(Map<String, dynamic> json) {
    startTime = DateTime.parse(json['startTime']);
    humidity = json['values']['humidity'].toDouble();
    precipitation = json['values']['precipitationProbability'];
    sunriseTime = DateTime.parse(json['values']['sunriseTime'] ?? '2022-01-01');
    sunsetTime = DateTime.parse(json['values']['sunsetTime'] ?? '2022-01-01');
    temperature = json['values']['temperature'].toInt();
    weatherCode = json['values']['weatherCode'];
    windSpeed = json['values']['windSpeed'].toDouble();
  }
}
