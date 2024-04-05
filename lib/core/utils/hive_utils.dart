import 'package:hive_flutter/hive_flutter.dart';
import 'package:show_hub/core/resources/app_hive_string.dart';

class HiveUtils {
  static Future<void> openAllBox() async {
    await Hive.openBox(AppHiveString.firstTimeBox);
    await Hive.openBox(AppHiveString.itemBox);
  }

  static writeInFirstTimeHiveBox() {
    var box = Hive.box(AppHiveString.firstTimeBox);
    box.put(AppHiveString.firstTimeKey, false);
  }

  static writeInFirstTimeHiveBoxtrue() {
    var box = Hive.box(AppHiveString.firstTimeBox);
    box.put(AppHiveString.firstTimeKey, true);
  }

  static bool readFirstTimeHiveBox() {
    var box = Hive.box(AppHiveString.firstTimeBox);
    return box.get(AppHiveString.firstTimeKey,defaultValue: true);
  }
}
