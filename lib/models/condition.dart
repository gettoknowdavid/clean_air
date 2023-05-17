enum Condition { asthma, hbp, bronchitis, lungCancer, emphysema, none }

extension ConditionNameExtension on Condition {
  String get name {
    switch (this) {
      case Condition.asthma:
        return 'Asthma';
      case Condition.hbp:
        return 'High Blood Pressure';
      case Condition.bronchitis:
        return 'Bronchitis';
      case Condition.lungCancer:
        return 'Lung Cancer';
      case Condition.emphysema:
        return 'Emphysema';
      default:
        return 'None';
    }
  }
}
