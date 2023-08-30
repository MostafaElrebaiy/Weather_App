import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'f92200d77ad84d9392f133825232503';

  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;
  try{
    Uri url =
    Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);

    var jsonData = data['forecast']['forecastday'][0];
     weather = WeatherModel.fromJson(data);
  }catch(e){
  }
    return weather;
  }
}
