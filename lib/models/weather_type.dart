import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum WeatherType { dew, hum, pres, temp, wind }

extension WeatherUnit on WeatherType {
  IconData toIcon() {
    String enumString = toString().split('.').last;

    switch (enumString) {
      case 'dew':
        return PhosphorIcons.regular.cloud;
      case 'hum':
        return PhosphorIcons.regular.drop;
      case 'pres':
        return PhosphorIcons.regular.umbrella;
      case 'temp':
        return PhosphorIcons.regular.thermometerSimple;
      default:
        return PhosphorIcons.regular.wind;
    }
  }

  String toUnit() {
    String enumString = toString().split('.').last;

    switch (enumString) {
      case 'dew':
        return 'C° Td';
      case 'hum':
        return '%Hum.';
      case 'pres':
        return 'ATM';
      case 'temp':
        return 'C°';
      default:
        return 'km/h';
    }
  }
}
