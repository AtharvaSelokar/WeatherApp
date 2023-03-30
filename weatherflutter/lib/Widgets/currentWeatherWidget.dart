import 'package:flutter/material.dart';

import '../Models/weather/weatherDataCurrent.dart';
class CurrentWeatherWidget extends StatelessWidget {

  final WeatherDataCurrent weatherDataCurrent;
   CurrentWeatherWidget({Key? key,required this.weatherDataCurrent})
     : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
      TempretureAreaWidget(),
        SizedBox(height: 20,),
        currentWeatherMoreDetails(),
      ],
    );
  }
  Widget  currentWeatherMoreDetails(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 60,
              width: 60,
              padding:  EdgeInsets.all(16),
              decoration:  BoxDecoration(color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(18),

                // borderRadius: BorderRadius.circular(25),
              ),
              child: Image.asset("assets/icons/windspeed.png"),
            ),
            Container(
              height: 60,
              width: 60,
              padding:  EdgeInsets.all(16),
              decoration:  BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(18),

                // borderRadius: BorderRadius.circular(18),
              ),
              child: Image.asset("assets/icons/clouds.png"),
            ),
            Container(
              height: 60,
              width: 60,
              padding:  EdgeInsets.all(16),
              decoration:  BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(18),

                // borderRadius: BorderRadius.circular(25),
              ),
              child: Image.asset("assets/icons/humidity.png"),
            )
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 20,
            width: 50,
            child: Text("${weatherDataCurrent.current.windSpeed}km/h",
            style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),),
            SizedBox(height: 20,
              width: 50,
              child: Text("${weatherDataCurrent.current.clouds}%",
                style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),),
            SizedBox(height: 20,
              width: 50,
              child: Text("${weatherDataCurrent.current.humidity}%",
                style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),)
          ],
        )
      ],
    );
  }
  Widget TempretureAreaWidget (){
return Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
children: [
  Image.asset(
    "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
  //   height: 80,
  //   width: 80,
  ),
  Container(
    height: 50,
    width: 1,
    // color: Colors.white10.diverLine,
  ),
  RichText(text: TextSpan(children: [
    TextSpan(text: "${weatherDataCurrent.current.temp!.toInt()}°",
    style: const TextStyle(
      fontSize: 68,fontWeight: FontWeight.w600,color: Colors.black,
    )),
    TextSpan(text: "${weatherDataCurrent.current.weather![0].description}°",
        style: const TextStyle(
          fontSize: 18,fontWeight: FontWeight.w400,color: Colors.black,
        ))
  ]),

  )
],
);
  }

}
