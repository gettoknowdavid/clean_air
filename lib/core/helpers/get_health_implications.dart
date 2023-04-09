const String _kGood =
    'Air quality is considered satisfactory, and air pollution poses little or no risk';
const String _kHazardous =
    'Health alert: everyone may experience more serious health effects';
const String _kModerate =
    'Air quality is acceptable; however, for some pollutants there may be a moderate health concern for a very small number of people who are unusually sensitive to air pollution.';
const String _kUnhealthy =
    'Everyone may begin to experience health effects; members of sensitive groups may experience more serious health effects.';
const String _kUnhealthyForSensitiveGroups =
    'Members of sensitive groups may experience health effects. The general public is not likely to be affected.';
const String _kVeryUnhealthy =
    'Health warnings of emergency conditions. The entire population is more likely to be affected.';

String getHealthImplications(int index) {
  switch (index ~/ 50) {
    case 0:
      return _kGood;
    case 1:
      return _kModerate;
    case 2:
      return _kUnhealthyForSensitiveGroups;
    case 3:
      return _kUnhealthy;
    case 4:
    case 5:
      return _kVeryUnhealthy;
    default:
      return _kHazardous;
  }
}
