import 'package:flutter/material.dart';
import 'package:weather_tracking/contollers/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.red, Colors.blue, Colors.red],
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
        )),
        child: Obx(
          () => SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _rowItem(Icons.location_city_outlined,
                    "Your location is ${_controller.address}"),
                const SizedBox(height: 18),
                _rowItem(Icons.thermostat_outlined,
                    "The temperature is ${_controller.temperature}"),
                const SizedBox(height: 18),
                _rowItem(Icons.info_outline,
                    "You should ${_controller.infoText.value}"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _rowItem(IconData icon, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            icon,
            size: 32,
          ),
          const SizedBox(width: 8),
          Expanded(
              child: Text(
            text,
            style: const TextStyle(fontSize: 18),
          ))
        ]),
      ),
    );
  }
}
