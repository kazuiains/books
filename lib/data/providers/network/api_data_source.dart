import 'package:books/data/providers/network/api_provider.dart';
import 'package:dio/dio.dart';

class ApiDataSource {
  final Dio? dio;

  ApiDataSource({
    this.dio,
  });

  Future<dynamic> execute({
    String? urlPath,
    String? savePath,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    dynamic body,
    HTTPMethod? method,
    String? contentType,
    ResponseType? responseType,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool? deleteOnError,
    String? lengthHeader,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Duration? sendTimeout,
    String? baseUrl,
  }) {
    return APIProvider.instance.request(
      urlPath ?? "",
      savePath: savePath,
      headers: headers,
      params: params,
      body: body,
      method: method,
      contentType: contentType,
      responseType: responseType,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
      deleteOnError: deleteOnError,
      lengthHeader: lengthHeader,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
      baseUrl: baseUrl,
      dio: dio,
    );
  }
}
