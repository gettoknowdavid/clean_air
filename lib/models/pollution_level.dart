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
    switch (this) {
      case PollutionLevel.good:
        return 'Good';
      case PollutionLevel.moderate:
        return 'Moderate';
      case PollutionLevel.unhealthy:
        return 'Unhealthy';
      case PollutionLevel.hazardous:
        return 'Hazardous';
      case PollutionLevel.veryUnhealthy:
        return 'Very Unhealthy';
      case PollutionLevel.unhealthyForSensitiveGroups:
        return 'Unhealthy for Sensitive Groups';
      default:
        return '';
    }
  }

  String toSentence() {
    return 'The air today is ${toName()}';
  }
}
