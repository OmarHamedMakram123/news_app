import 'package:dio/dio.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../api/status_code.dart';

class ErrorHandler {
  final String errorMessage;
  final int? code;

  ErrorHandler({required this.errorMessage, this.code});

  static ErrorHandler fromException(
      Exception exception, AppLocalizations locale) {
    if (exception is DioException) {
      return _handleDioException(exception, locale);
    } else {
      return ErrorHandler(errorMessage: locale.unknown);
    }
  }

  static ErrorHandler _handleDioException(
      DioException exception, AppLocalizations locale) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ErrorHandler(errorMessage: locale.connectionError);
      case DioExceptionType.badCertificate:
        return ErrorHandler(errorMessage: locale.badCertificate);
      case DioExceptionType.badResponse:
        return exception.response != null
            ? ErrorHandler._fromResponse(exception.response!, locale)
            : ErrorHandler(errorMessage: locale.unknown);
      case DioExceptionType.connectionError:
        return ErrorHandler(errorMessage: locale.connectionError);
      default:
        return ErrorHandler(errorMessage: locale.unknown);
    }
  }

  static ErrorHandler _fromResponse(
      Response<dynamic> response, AppLocalizations locale) {
    switch (response.statusCode) {
      case StatuesCodes.unauthorized:
      case StatuesCodes.forbidden:
        return ErrorHandler(
            errorMessage: response.data?["error"] ?? locale.unauthorized,
            code: 401);
      case StatuesCodes.conflict:
        return ErrorHandler(
            errorMessage: response.data?["error"] ?? locale.conflict,
            code: 409);
      case StatuesCodes.notFound: // Fixed typo here
        return ErrorHandler(errorMessage: locale.notFount);
      case StatuesCodes.internalServerError:
        return ErrorHandler(errorMessage: locale.internalServerError);
      default:
        return ErrorHandler(errorMessage: locale.unknown);
    }
  }
}
