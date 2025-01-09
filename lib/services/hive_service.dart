import 'dart:io';

import 'package:template/enums/hive_box_type.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:synchronized/synchronized.dart';
import 'package:path/path.dart' as path;

class HiveService {
  factory HiveService() => _sharedInstance();
  static HiveService? _instance;
  HiveService._();
  static HiveService _sharedInstance() {
    _instance ??= HiveService._();
    return _instance!;
  }

  static final _lock = Lock();
  static final Set<String> boxNames = {};
  static HiveBoxType? cureenBoxType;
  static Future<void> init() async {
    await getApplicationCacheDirectory();
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    final String hiveDirectoryPath =
        path.join(appDocumentDirectory.path, 'hive_database');
    final hiveDirectory = Directory(hiveDirectoryPath);
    if (!hiveDirectory.existsSync()) {
      hiveDirectory.createSync(recursive: true);
    }
    Hive.init(hiveDirectoryPath);
    // Hive.registerAdapter(HiveBeaconModelAdapter());
  }

  static Future<void> clearBeaconBox() async {
    final box = await getBeaconBox();
    box.clear();
  }

  static Future<Box> getBeaconBox() async {
    return _lock.synchronized(() async {
      final boxName = HiveBoxType.DEFAULT.boxName;
      Box box;
      if (Hive.isBoxOpen(boxName)) {
        box = Hive.box(boxName);
        await box.close();
      }
      box = await Hive.openBox(boxName);
      return box;
    });
  }

  static Future<void> closeAllBoxes() async {
    var closingTasks = <Future>[];
    for (var type in HiveBoxType.values) {
      final boxName = type.boxName;
      if (await Hive.boxExists(boxName) && Hive.isBoxOpen(boxName)) {
        switch (type) {
          case HiveBoxType.DEFAULT:
            closingTasks.add(Hive.box(boxName).close());
            break;
        }
      }
    }
    await Future.wait(closingTasks);
  }
}
