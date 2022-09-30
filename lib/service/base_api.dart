import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../core/config/flavor.dart';
import '../core/exception/exception.dart';

class BaseApi {
  final FlavorConfig env;

  BaseApi(this.env) {
    FlavorConfig? env = FlavorConfig.instance;
    print("FlavorConfig info => ${env.env}");
  }

  static BaseOptions options = BaseOptions(
    baseUrl: FlavorConfig.instance.values!.baseApi!,
    receiveTimeout: FlavorConfig.instance.values!.delay,
    connectTimeout: FlavorConfig.instance.values!.delay,
    sendTimeout: FlavorConfig.instance.values!.delay,
  );

  Dio _dio = Dio(BaseApi.options)
    ..interceptors.add(
      PrettyDioLogger(
        responseBody: false,
        request: false,
        requestBody: false,
        responseHeader: false,
        compact: false,
      ),
    );

  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      if (e is DioError) {
        throw ServerException.fromDioError(e);
      } else {
        throw e;
      }
    }
  }

  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      if (e is DioError) {
        throw ServerException.fromDioError(e);
      } else {
        throw e;
      }
    }
  }

  Future<dynamic> delete(String uri,
      {data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken}) async {
    try {
      final Response response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      if (e is DioError) {
        throw ServerException.fromDioError(e);
      } else {
        throw e;
      }
    }
  }

  Future<dynamic> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      if (e is DioError) {
        throw ServerException.fromDioError(e);
      } else {
        throw e;
      }
    }
  }
}
