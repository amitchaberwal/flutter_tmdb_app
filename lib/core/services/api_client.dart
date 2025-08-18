import 'package:dio/dio.dart';
import 'package:insort_assignment/core/config/app_config.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkClient{
  Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppConfig().appEnv.apiBaseUrl,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYTY3ZTJmZTFkOTFiOTc0N2EyMjdmMWZhZTgwZDU1OCIsIm5iZiI6MTc1NTI1NTY1Ny40ODg5OTk4LCJzdWIiOiI2ODlmMTM2OTJhMTkxZTNmOTU4ZDlmNTIiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.wFidRPHxjgpGUJmSGe335KABr1YBxVWJJDzd_e1iz7s',
        },
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 20),
      ),
    );
    dio.interceptors.add(PrettyDioLogger());
    return dio;
  }
}
