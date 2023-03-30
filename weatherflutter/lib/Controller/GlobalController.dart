import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'dart:async';

import 'package:weatherflutter/Api/fetchWeather.dart';
import 'package:weatherflutter/Models/weather/weatherData.dart';
import 'package:weatherflutter/Models/weather/weatherDataCurrent.dart';
class GlobalController extends GetxController{
final RxBool _isLoading=true.obs;
final RxDouble _lattitude=  0.0.obs;
final RxDouble _longitude=  0.0.obs;
final RxInt _currentIndex=0.obs;

RxBool checkLoading() => _isLoading;
RxDouble getLattitude() => _lattitude;
RxDouble getLongitude() => _longitude;

final weatherData = WeatherData().obs;


WeatherData getData(){
  return weatherData.value;
}

@override
  void onInit(){
if(_isLoading.isTrue){
  getLocation();
}else{
  getIndex();
}
super.onInit();
}
getLocation()async{
  bool isServiceEnabled;
  LocationPermission locationPermission;
  isServiceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!isServiceEnabled) {
    return Future.error("Location not enabled");
   }
  locationPermission=await Geolocator.checkPermission();
  if(locationPermission==LocationPermission.deniedForever){
    return  Future.error("Location is denied forever");
  }else if(locationPermission==LocationPermission.denied){
 locationPermission= await Geolocator.requestPermission();
 if(locationPermission==LocationPermission.denied){
   return Future.error("Location permission is denied");
 }
  }
  // getting current position
  return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high).then((value){

    _lattitude.value=value.latitude;
    _longitude.value=value.longitude;
//calling api
    return fetchWeatherAPI().processData
      (value.latitude, value.longitude).then((value) {
        weatherData.value=value;
        _isLoading.value=false;
        print(_lattitude.value);
        print(_longitude.value);

    });

    // _isLoading.value=false;
    // print(_lattitude.value);
    // print(_longitude.value);

  });
  }


  RxInt getIndex(){
  return _currentIndex;
  }
}