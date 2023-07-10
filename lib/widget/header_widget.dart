import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:npf_weather/controller/global_controller.dart';
import 'package:npf_weather/utils/app_textstyle.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "";
  String area = "";
  String subarea = "";
  String date = DateFormat("EEE, MMM d y,").format(DateTime.now());
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  void initState() {
    getAddress(globalController.getLattitude().value,
        globalController.getLongitude().value);
    super.initState();
  }

  getAddress(lat, lon) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
    //print (placemarks);
    Placemark place = placemarks[0];
    setState(() {
      city = place.country!;
      area = place.administrativeArea!;
      subarea = place.subAdministrativeArea!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.topLeft,
          child: (city == null)
              ? Text("NO LOCATION")
              : Text(
                  //city,
                  //area,
                  subarea,
                  style: AppTextstyle.h2Bold,
                ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          alignment: Alignment.topLeft,
          child: Text(
            date,
            style: AppTextstyle.h4Regular,
          ),
        )
      ],
    );
  }
}
