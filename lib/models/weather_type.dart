import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum WeatherType { dew, hum, pres, temp, wind }

extension WeatherUnit on WeatherType {
  IconData toIcon() {
    String enumString = toString().split('.').last;

    switch (enumString) {
      case 'dew':
        return PhosphorIcons.cloud;
      case 'hum':
        return PhosphorIcons.drop;
      case 'pres':
        return PhosphorIcons.umbrella;
      case 'temp':
        return PhosphorIcons.thermometerSimple;
      default:
        return PhosphorIcons.wind;
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
