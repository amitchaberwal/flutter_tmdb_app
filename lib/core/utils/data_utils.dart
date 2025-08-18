// Dart imports:
import 'dart:convert';

class DataUtils {
  static Map<String, dynamic> decodeQueryParams(
    Map<String, String> queryParams,
  ) {
    final dynamicValues = <String, dynamic>{};
    queryParams.forEach((key, value) {
      try {
        dynamicValues[key] = jsonDecode(value);
      } catch (e) {
        dynamicValues[key] = value;
      }
    });

    return dynamicValues;
  }
}
