import 'package:dio/dio.dart';
import 'package:solid_data_api/src/core/core.dart';

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
        throw ServerException(message: 'Bad request ' + error["msg"]);
      case 404:
        throw ServerException(message: 'Not Found');
      case 500:
        throw ServerException(message: 'Internal server error');
      default:
        throw ServerException(message: 'Oops something went wrong');
    }
  }
}

class UnknownException implements Exception {
  final String? message;

  UnknownException({this.message});
}
