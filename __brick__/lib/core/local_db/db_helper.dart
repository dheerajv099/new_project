import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

/// [DbHelper] manage local Database
class DbHelper {

  late Box box;

  Future<void> initHive() async {
    final document = await getApplicationDocumentsDirectory();
    Hive.init(document.path);
    box = await Hive.openBox('LMG_BOX');
  }
}
