import 'package:objectbox/objectbox.dart';

@Entity()
class InitEntity {
  @Id(assignable: true)
  final int id;

  final int? isInitialStartUp;

  final int? isInitialLogin;

  const InitEntity({
    required this.id,
    this.isInitialStartUp = 0,
    this.isInitialLogin = 0,
  });
}
