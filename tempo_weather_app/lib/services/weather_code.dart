class WeatherCode {
  static String getStatus(int code) {
    switch (code) {
      case 1000:
        return 'Clear';
      case 1100:
        return 'Mostly Clear';
      case 1101:
        return 'Partly Cloudy';
      case 1102:
        return 'Mostly Cloudy';
      case 1001:
        return 'Cloudy';
      case 2100:
        return 'Light Fog';
      case 2000:
        return 'Fog';
      case 4000:
        return 'Drizzle';
      case 4200:
        return 'Light Rain';
      case 4001:
        return 'Rain';
      case 4201:
        return 'Heavy Rain';
      case 5001:
        return 'Flurries';
      case 5100:
        return 'Light Snow';
      case 5000:
        return 'Snow';
      case 5101:
        return 'Heavy Snow';
      case 8000:
        return 'Thunderstorm';
      case 6000:
        return 'Freezing Drizzle';
      case 6200:
        return 'Light Freezing Drizzle';
      case 6001:
        return 'Freezing Rain';
      case 6201:
        return 'Heavy Freezing Rain';
      default:
        return 'Clear';
    }
  }

  static String getImage1h(int code, DateTime time) {
    switch (code) {
      case 1000:
        return (time.hour >= 6 && time.hour <= 18)
            ? 'assets/images/clear_day.png'
            : 'assets/images/clear_night.png';
      case 1100:
        return (time.hour >= 6 && time.hour <= 18)
            ? 'assets/images/mostly_clear_day.png'
            : 'assets/images/mostly_clear_night.png';
      case 1101:
        return (time.hour >= 6 && time.hour <= 18)
            ? 'assets/images/partly_cloudy_day.png'
            : 'assets/images/partly_cloudy_night.png';
      case 1102:
        return (time.hour >= 6 && time.hour <= 18)
            ? 'assets/images/partly_cloudy_day.png'
            : 'assets/images/partly_cloudy_night.png';
      case 1001:
        return 'assets/images/cloudy.png';
      case 2100:
        return 'assets/images/fog.png';
      case 2000:
        return 'assets/images/fog.png';
      case 4000:
        return 'assets/images/drizzle.png';
      case 4200:
        return 'assets/images/rain_light.png';
      case 4001:
        return 'assets/images/rain.png';
      case 4201:
        return 'assets/images/rain_heavy.png';
      case 8000:
        return 'assets/images/tstorm.png';
      default:
        return 'assets/images/rain_heavy.png';
    }
  }

  static String getImage1d(int code, DateTime time) {
    switch (code) {
      case 1000:
        return 'assets/images/clear_day.png';
      case 1100:
        return 'assets/images/mostly_clear_day.png';
      case 1101:
        return 'assets/images/partly_cloudy_day.png';
      case 1102:
        return 'assets/images/partly_cloudy_day.png';
      case 1001:
        return 'assets/images/cloudy.png';
      case 2100:
        return 'assets/images/fog.png';
      case 2000:
        return 'assets/images/fog.png';
      case 4000:
        return 'assets/images/drizzle.png';
      case 4200:
        return 'assets/images/rain_light.png';
      case 4001:
        return 'assets/images/rain.png';
      case 4201:
        return 'assets/images/rain_heavy.png';
      case 8000:
        return 'assets/images/tstorm.png';
      default:
        return 'assets/images/rain_heavy.png';
    }
  }

  static String getBackgroundImage(int code, DateTime time) {
    switch (code) {
      case 1000:
        return (time.hour >= 6 && time.hour <= 18)
            ? 'assets/images/clear_day_bac.png'
            : 'assets/images/clear_night_bac.png';
      case 1100:
        return (time.hour >= 6 && time.hour <= 18)
            ? 'assets/images/mostly_clear_day_bac.png'
            : 'assets/images/mostly_clear_night_bac.png';
      case 1101:
        return (time.hour >= 6 && time.hour <= 18)
            ? 'assets/images/partly_cloudy_day_bac.png'
            : 'assets/images/partly_cloudy_night_bac.png';
      case 1102:
        return (time.hour >= 6 && time.hour <= 18)
            ? 'assets/images/partly_cloudy_day_bac.png'
            : 'assets/images/partly_cloudy_night_bac.png';
      case 1001:
        return 'assets/images/cloudy_bac.png';
      case 2100:
        return 'assets/images/fog_bac.png';
      case 2000:
        return 'assets/images/fog_bac.png';
      case 4000:
        return 'assets/images/drizzle_bac.png';
      case 4200:
        return 'assets/images/rain_light_bac.png';
      case 4001:
        return 'assets/images/rain_bac.png';
      case 4201:
        return 'assets/images/rain_heavy_bac.png';
      case 8000:
        return 'assets/images/tstorm_bac.png';
      default:
        return 'assets/images/rain_heavy_bac.png';
    }
  }
}
