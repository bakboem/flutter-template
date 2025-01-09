// * box == DB
// * DB 구분자.

enum HiveBoxType { DEFAULT }

//* DB name 사전 정의 후  Hive.OpenBox(dbName){} 으로 사용.
extension HiveBoxTypeExtension on HiveBoxType {
  String get boxName {
    switch (this) {
      case HiveBoxType.DEFAULT:
        return '${_generateBoxNameForMinute()}beacon_minute';
    }
  }

  String _generateBoxNameForMinute() {
    return 'box_';
  }
}
