import 'package:clean_air/models/init_entity.dart';
import 'package:clean_air/objectbox.g.dart';
import 'package:clean_air/ui/common/app_strings.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class ObjectBoxService {
  late Store store;

  ObjectBoxService._create(this.store) {
    //
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBoxService> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final str = await openStore(directory: p.join(docsDir.path, kDBName));
    return ObjectBoxService._create(str);
  }

  void put<T>(T object) {
    final box = store.box<T>();
    try {
      box.put(object);
    } on ObjectBoxException catch (e) {
      throw Exception(e.message);
    }
  }

  bool isEmpty<T>() {
    return store.box<T>().isEmpty();
  }

  Future<bool> isInitialStartup() async {
    final object = await store.box<InitEntity>().getAsync(1);
    if (object == null || object.isInitialStartUp == 0) {
      return true;
    } else {
      return false;
    }
  }
}
