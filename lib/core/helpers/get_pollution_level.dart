import 'package:clean_air/models/pollution_level.dart';

PollutionLevel getPollutionLevel(int index) {
  switch (index ~/ 50) {
    case 0:
      return PollutionLevel.good;
    case 1:
      return PollutionLevel.moderate;
    case 2:
      return PollutionLevel.unhealthyForSensitiveGroups;
    case 3:
      return PollutionLevel.unhealthy;
    case 4:
    case 5:
      return PollutionLevel.veryUnhealthy;
    default:
      return PollutionLevel.hazardous;
  }
}
