import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../core/network/api/api_constants.dart';

@injectable
class AppInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters["apiKey"] = ApiConstants.apiKey1;
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }

}
