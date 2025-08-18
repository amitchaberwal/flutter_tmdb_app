// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:insort_assignment/core/constants/hive_key_constants.dart';
import 'package:insort_assignment/core/helpers/app_completers.dart';
import 'package:insort_assignment/core/services/database/app_database.dart';
import 'package:path_provider/path_provider.dart';


class HiveDatabase extends AppDatabase {
  @override
  Future<void> init() async {
    if (!kIsWeb) {
      final appDocumentDir = await getApplicationDocumentsDirectory();
      Hive.init(appDocumentDir.path);
    }

    await Hive.initFlutter();
    await openDB(dbName: HiveBoxConstants.coreBox);
    await openDB(dbName: HiveBoxConstants.moviesBox);
    await openDB(dbName: HiveBoxConstants.userBox);

    AppCompleter.hiveInitCompleter.complete();
  }

  @override
  Future<void> openDB({
    required String dbName,
  }) async {
    await Hive.openBox(dbName);
  }
  @override
  Future<Box> getDB({
    required String dbName,
  }) async {
    await AppCompleter.hiveInitCompleter.future;
    return Hive.box(dbName);
  }

  @override
  Future<void> writeData({
    required String dbName,
    required String key,
    required data,
  }) async {
    await AppCompleter.hiveInitCompleter.future;
    final box = Hive.box(dbName);
    box.put(key, jsonEncode(data));
  }

  @override
  Future readData({
    required String dbName,
    required String key,
    defaultValue,
  }) async {
    await AppCompleter.hiveInitCompleter.future;
    final box = Hive.box(dbName);

    return jsonDecode(box.get(key, defaultValue: jsonEncode(defaultValue)));
  }

  @override
  Future<void> deleteDB({required String dbName}) async {
    await AppCompleter.hiveInitCompleter.future;
    final box = Hive.box(dbName);
    await box.clear();
  }

  @override
  Future<void> removeData({required String dbName, String? key}) async {
    await AppCompleter.hiveInitCompleter.future;
    final box = Hive.box(dbName);
    if (key == null) {
      deleteDB(dbName: dbName);
    } else {
      if (box.containsKey(key)) {
        await box.delete(key);
      }
    }
  }

  @override
  Future<void> closeDB({required String dbName}) async {
    await AppCompleter.hiveInitCompleter.future;
    final box = Hive.box(dbName);
    await box.close();
  }
}
