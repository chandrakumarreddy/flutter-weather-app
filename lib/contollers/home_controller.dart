import 'package:get/get.dart';
import 'package:weather_tracking/models/location_data.dart';
import 'package:weather_tracking/models/weathere_data.dart';
import 'package:weather_tracking/repository/weather_repository.dart';

class HomeController extends GetxController {
  final WeatherRepository _repository = Get.find();
  Rxn<LocationData> locationData = Rxn();
  Rxn<WeatherData> weatherData = Rxn();
  RxString infoText = '...'.obs;

  String get address =>
      "${locationData.value?.regionName}, ${locationData.value?.country}";
  String get temperature => "${weatherData.value?.temp}";

  @override
  void onInit() async {
    super.onInit();
    await getCurrentLocation();
    await getTemperatureForCurrentLocation();
  }

  getCurrentLocation() async {
    LocationData? location = await _repository.getCurrentLocation();

    locationData.value = location;
  }

  getTemperatureForCurrentLocation() async {
    if (locationData.value != null) {
      weatherData.value =
          await _repository.getWeatherForLocation(locationData.value!);
      _getInfoText(weatherData.value?.temp);
    }
  }

  _getInfoText(int? temperature) {
    if (temperature == null) {
      infoText.value = "unknown";
    } else if (temperature <= 0) {
      infoText.value =
          "make sure to dress thick cloths! It's freezing out there!";
    } else if (temperature <= 15) {
      infoText.value = "wear a jacket, don't catch a cold!";
    } else {
      infoText.value = "enjoy the weather, it's nice!";
    }
  }
}
