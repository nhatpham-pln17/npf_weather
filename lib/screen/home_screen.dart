import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:npf_weather/controller/global_controller.dart';
import 'package:npf_weather/widget/currentweather_widget.dart';
import 'package:npf_weather/widget/header_widget.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}): super(key:key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

  //call
   final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Obx(() => globalController.checkLoading().isTrue
      ? const Center(child: CircularProgressIndicator(),)
      :ListView(
        scrollDirection: Axis.vertical,
        children: [
          const SizedBox(height: 10),
          const HeaderWidget(),

          CurrentWeatherWidget(weatherDataCurrent: globalController.getData().getCurrentWeather()),
        ],
      ),)),
    );
  }
}