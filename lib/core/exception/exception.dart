import 'package:dio/dio.dart';
import 'package:solid_principle_app/core/values/constants.dart';

class ServerException implements Exception {
  final String? message;

  ServerException({this.message});

  factory ServerException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        throw ServerException(message: EXCEPTION_CANCEL);
      case DioErrorType.connectTimeout:
        throw ServerException(message: EXCEPTION_CONNECTION_RTO);
      case DioErrorType.receiveTimeout:
        throw ServerException(message: EXCEPTION_RECEIVE_RTO);
      case DioErrorType.response:
        throw _handleError(dioError.response!.statusCode!, dioError.response!.data);
      case DioErrorType.sendTimeout:
        throw ServerException(message: EXCEPTION_SEND_RTO);
      case DioErrorType.other:
        throw ServerException(message: EXCEPTION_OTHER);
      default:
        throw ServerException(message: EXCEPTION_UNKNOWN);
    }
  }

  static ServerException _handleError(int statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        throw ServerException(message: '$EXCEPTION_BAD_REQ ' + error["msg"]);
      case 404:
        throw ServerException(message: EXCEPTION_NOT_FOUND);
      case 500:
        throw ServerException(message: EXCEPTION_ISE);
      default:
        throw ServerException(message: EXCEPTION_WRONG);
    }
  }
}

class CacheException implements Exception {
  final String? message;

  CacheException({this.message});
}

class UnknownException implements Exception {
  final String? message;

  UnknownException({this.message});
}
