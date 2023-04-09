enum PollutionLevel {
  good,
  moderate,
  unhealthyForSensitiveGroups,
  unhealthy,
  veryUnhealthy,
  hazardous
}

extension PollutionLevelExtension on PollutionLevel {
  String toName() {
    String enumString = toString().split('.').last;
    return enumString[0].toUpperCase() +
        enumString.substring(1).replaceAll(RegExp(r'(?<=[a-z])[A-Z]'), ' \$&');
  }
}
