import 'package:get/get.dart';
import 'package:weather_tracking/contollers/home_controller.dart';
import 'package:weather_tracking/repository/weather_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WeatherRepository());
    Get.lazyPut(() => HomeController());
  }
}
