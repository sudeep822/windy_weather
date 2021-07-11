import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

//const apiKey = 'add your api'
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp >=  37) {
      return 'Heat 🔥 Wave';
    } else if (temp >= 32 && temp <= 36 ) {
      return 'Very hot. Time for 🍨 ';
    }
    else if (temp >= 26 && temp < 32 ) {
      return 'It\'s Hot. Have some 🍉  ';

    }
    else if (temp >= 4 && temp < 26 ) {
      return 'It\'s warm,mild & cool ☕  ';

    } else {
      return 'It\'s freezing ❄️';
    }
  }
}
