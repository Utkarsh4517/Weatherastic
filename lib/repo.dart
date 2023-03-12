import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/weather_model.dart';

class Repo {
  getWeather(String? city) async {
    var url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&lon={lon}&appid=6322c2805cd3aa3d79999fedcaba61bb&units=metric";

    final res = await http.get(Uri.parse(url));

    var resBody = res.body;
    print(resBody);
    try {
      if (res.statusCode == 200) {
        return WeatherModel.fromJson(json.decode(resBody));
      }
    } catch (e) {
      throw Exception();
    }
  }
}