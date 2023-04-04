import 'package:objectbox/objectbox.dart';

@Entity()
class LastAqi {
  @Id(assignable: true)
  int? id;

  int aqi;

  LastAqi({this.id, required this.aqi});
}
