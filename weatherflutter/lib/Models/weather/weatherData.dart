import 'package:weatherflutter/Models/weather/weatherDataCurrent.dart';
import 'package:weatherflutter/Models/weather/weatherDataDaily.dart';
import 'package:weatherflutter/Models/weather/weatherDataHourly.dart';

class WeatherData{
  final  WeatherDataCurrent? current;
  final WeatherDataHourly?hourly;
  final WeatherDataDaily?daily;
  WeatherData({this.current,this.hourly,this.daily});
  //funct. to fetch value
WeatherDataCurrent getCurrentWeather()=> current!;
WeatherDataHourly getHourlyWeather()=> hourly!;
WeatherDataDaily getDailyWeather()=>daily!;

}