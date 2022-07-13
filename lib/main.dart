import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_tracking/bindings/home_binding.dart';
import 'package:weather_tracking/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Weather Tracker',
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(name: '/', page: () => HomePage(), binding: HomeBinding())
        ]);
  }
}
