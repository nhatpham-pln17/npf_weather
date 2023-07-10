import 'package:flutter/material.dart';
import 'package:npf_weather/model/weatherdata_current.dart';
import 'package:npf_weather/utils/app_color.dart';
import 'package:npf_weather/utils/app_textstyle.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ComfortWeather extends StatelessWidget{
  final WeatherDataCurrent weatherDataCurrent;
  const ComfortWeather({Key? key, required this.weatherDataCurrent}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 10),
          child: Text(
            "UV Index",
            style: AppTextstyle.h3Bold,
          ),
        ),
        SizedBox(
          height: 160,
          child: Center(
            child: SleekCircularSlider(
              initialValue: weatherDataCurrent.current.uvIndex!.toDouble(),
              min: 0,
              max: 11,
              appearance: CircularSliderAppearance(
                customColors: CustomSliderColors(
                  trackColor: AppColors.dividerLine,
                  progressBarColors: [
                    AppColors.error,
                    AppColors.warning,
                    AppColors.success,
                  ]
                ),
                infoProperties: InfoProperties(
                  modifier: (double uvi) {
                    final uvi = weatherDataCurrent.current.uvIndex!.toDouble();
                    return '$uvi';
                  },
                  mainLabelStyle: AppTextstyle.h2Bold,
                  bottomLabelStyle: AppTextstyle.b1Bold,
                  bottomLabelText: "0                 11",
                )
              ),
            )
          ),
        ),
      ],
    );
  }
}