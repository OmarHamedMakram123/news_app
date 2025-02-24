import 'package:app_5_news_app/core/network/api/api_constants.dart';
import 'package:app_5_news_app/src/data/api/app_interceptors.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
@injectable
abstract class NetworkFactoryDio {
  @lazySingleton
  Dio dioProvider(AppInterceptors appInterceptors) {
    final Dio dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: ApiConstants.duration),
        sendTimeout: const Duration(seconds: ApiConstants.duration),
        receiveTimeout: const Duration(seconds: ApiConstants.duration),
      ),
    );

    dio.interceptors.add(providePretty());
    dio.interceptors.add(appInterceptors);

    return dio;
  }

  @lazySingleton
  LogInterceptor providePretty() {
    return LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      request: true,
    );
  }
}
