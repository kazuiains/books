import 'package:dio/dio.dart';
import 'package:books/app/config/app_strings.dart';
import 'package:books/app/exception/api_exception.dart';
import 'package:books/data/providers/network/api_provider.dart';
import 'package:books/data/providers/network/api_request_representable.dart';

class ApiDataSource {
  Future<dynamic> execute({
    String? baseUrl,
    String? endpoint,
    String? path,
    Map<String, String>? headers,
    String? contentType,
    ResponseType? responseType,
    Map<String, String>? params,
    dynamic body,
    HTTPMethod? method,
    String? downloadPath,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool? deleteOnError,
    String? lengthHeader,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Duration? sendTimeout,
    Dio? dio,
    Function(ApiException exception)? onBadResponse,
  }) async {
    try {
      return await ApiRepresentable(
        baseUrl: baseUrl,
        endpoint: endpoint,
        path: path,
        requestHeaders: headers,
        requestHeadersContentType: contentType,
        requestHeadersResponseType: responseType,
        requestParams: params,
        requestBody: body,
        requestMethod: method,
        downloadPath: downloadPath,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        deleteOnError: deleteOnError,
        lengthHeader: lengthHeader,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        sendTimeout: sendTimeout,
        dio: dio,
      ).request();
    } on ApiException catch (e) {
      if (e.code == AppStrings.codeAEResponse && onBadResponse != null) {
        throw onBadResponse(e);
      } else {
        rethrow;
      }
    } catch (e) {
      throw ApiException.undefined(
        details: e.toString(),
        response: e,
      );
    }
  }
}

class ApiRepresentable implements APIRequestRepresentable {
  ///endpoint option
  String? baseUrl;
  String? endpoint;
  String? path;
  Map<String, String>? requestHeaders;
  String? requestHeadersContentType;
  ResponseType? requestHeadersResponseType;
  Map<String, String>? requestParams;
  dynamic requestBody;
  HTTPMethod? requestMethod;
  String? downloadPath;

  ///dio option
  CancelToken? cancelToken;
  ProgressCallback? onSendProgress;
  ProgressCallback? onReceiveProgress;
  bool? deleteOnError;
  String? lengthHeader;
  Duration? connectTimeout;
  Duration? receiveTimeout;
  Duration? sendTimeout;
  Dio? dio;

  ApiRepresentable({
    this.baseUrl,
    this.endpoint,
    this.path,
    this.requestHeaders,
    this.requestHeadersContentType,
    this.requestHeadersResponseType,
    this.requestParams,
    this.requestBody,
    this.requestMethod,
    this.downloadPath,
    this.cancelToken,
    this.onSendProgress,
    this.onReceiveProgress,
    this.deleteOnError,
    this.lengthHeader,
    this.connectTimeout,
    this.receiveTimeout,
    this.sendTimeout,
    this.dio,
  });

  @override
  String get url => "${endpoint ?? ""}${path ?? ""}";

  @override
  Map<String, String>? get headers => requestHeaders;

  @override
  String? get contentType => requestHeadersContentType;

  @override
  ResponseType? get responseType => requestHeadersResponseType;

  @override
  Map<String, String>? get query => requestParams;

  @override
  get body => requestBody;

  @override
  HTTPMethod get method => requestMethod ?? HTTPMethod.get;

  @override
  String get savePath => downloadPath ?? "";

  @override
  Future request() {
    return APIProvider.instance.request(
      this,
      baseUrl: baseUrl,
      cancelToken: cancelToken,
      connectTimeout: connectTimeout,
      customDio: dio,
      deleteOnError: deleteOnError ?? true,
      lengthHeader: lengthHeader ?? Headers.contentLengthHeader,
      onReceiveProgress: onReceiveProgress,
      onSendProgress: onSendProgress,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
    );
  }
}
