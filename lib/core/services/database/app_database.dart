import 'package:hive_ce/hive.dart';

abstract class AppDatabase {
  Future<void> init();
  Future<void> openDB({required String dbName});
  Future<void> closeDB({required String dbName});
  Future<Box> getDB({required String dbName});
  Future<void> writeData({
    required String dbName,
    required String key,
    required dynamic data,
  });
  Future<dynamic> readData({
    required String dbName,
    required String key,
    dynamic defaultValue,
  });
  Future<void> removeData({
    required String dbName,
    String? key,
  });

  Future<void> deleteDB({
    required String dbName,
  });
}
