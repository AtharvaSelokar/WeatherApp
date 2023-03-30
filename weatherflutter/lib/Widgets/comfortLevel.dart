import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import '../Models/weather/weatherDataCurrent.dart';


class ComfortLevel extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const ComfortLevel({Key? key,required this.weatherDataCurrent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
children: [
  Container(
    margin:  EdgeInsets.only(top:1,right: 20,left: 20,bottom: 20),
    child: Text("Comfort Level",style: TextStyle(fontSize: 18),),
  ),
  SizedBox(
    height: 180,
    child: Column(
      children: [
        Center(
          child: SleekCircularSlider (min:0,max:100,
          initialValue:weatherDataCurrent.current.humidity!.toDouble(),
          appearance: CircularSliderAppearance(
            customWidths: CustomSliderWidths(
              handlerSize: 0,trackWidth: 12,progressBarWidth: 12,
            ),
            infoProperties: InfoProperties(
              bottomLabelText: 'Humidity',
              bottomLabelStyle:  TextStyle(letterSpacing: 0.1,fontSize: 14,height: 1.4)
            ),
            animationEnabled: true,size: 140,
            customColors: CustomSliderColors(
              trackColor: Colors.grey.withOpacity(0.3),
              progressBarColor: Colors.blueAccent
            ),
          ),
          )
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                  text: "Feels Like: ",
                  style: TextStyle(
                    fontSize: 14,height: 0.8,color: Colors.black,
                  ),
                ),
              TextSpan(
                text: "${weatherDataCurrent.current.feelsLike}",
                style: TextStyle(
                  fontSize: 14,height: 0.8,color: Colors.black,
                ),
              ),
                ],
              ),
            )
          ],
        )
      ],
    ),
  )
],
    );
  }
}
