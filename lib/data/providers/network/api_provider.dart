import 'dart:async';

import 'package:dio/dio.dart';
import 'package:books/app/config/app_config.dart';
import 'package:books/app/exception/api_exception.dart';
import 'package:books/data/providers/network/api_request_representable.dart';

class APIProvider {
  static Dio setup({
    Dio? customDio,
    String? baseUrl,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Duration? sendTimeout,
  }) {
    Dio dio;
    if (customDio != null) {
      dio = customDio;
    } else {
      dio = Dio(
        BaseOptions(
          baseUrl: baseUrl ?? AppConfig.instance!.baseUrl,
          connectTimeout: connectTimeout ?? const Duration(seconds: 30),
          receiveTimeout: receiveTimeout ?? const Duration(seconds: 30),
          sendTimeout: sendTimeout ?? const Duration(seconds: 30),
        ),
      )..httpClientAdapter;
    }

    if (AppConfig.instance!.flavor == Flavor.development) {
      dio.interceptors.add(
        LogInterceptor(
          request: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
          requestBody: true,
          error: true,
        ),
      );
    }

    return dio;
  }

  static final _singleton = APIProvider();

  static APIProvider get instance => _singleton;

  Future request(
    APIRequestRepresentable request, {
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool deleteOnError = true,
    String lengthHeader = Headers.contentLengthHeader,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Duration? sendTimeout,
    String? baseUrl,
    Dio? customDio,
  }) async {
    try {
      final client = setup(
        customDio: customDio,
        baseUrl: baseUrl,
        connectTimeout: connectTimeout,
        sendTimeout: sendTimeout,
        receiveTimeout: receiveTimeout,
      );

      Response response;

      var options = Options(
        headers: request.headers,
        contentType: request.contentType,
        responseType: request.responseType,
        validateStatus: (statusCode) => statusCode == 200 || statusCode == 201,
      );

      switch (request.method) {
        case HTTPMethod.get:
          response = await client.get(
            request.url,
            queryParameters: request.query,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
          );
          break;
        case HTTPMethod.post:
          response = await client.post(
            request.url,
            data: request.body,
            queryParameters: request.query,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
            onSendProgress: onSendProgress,
          );
          break;
        case HTTPMethod.delete:
          response = await client.delete(
            request.url,
            data: request.body,
            queryParameters: request.query,
            options: options,
            cancelToken: cancelToken,
          );
          break;
        case HTTPMethod.patch:
          response = await client.patch(
            request.url,
            data: request.body,
            queryParameters: request.query,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
            onSendProgress: onSendProgress,
          );
          break;
        case HTTPMethod.put:
          response = await client.put(
            request.url,
            data: request.body,
            queryParameters: request.query,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
            onSendProgress: onSendProgress,
          );
          break;
        case HTTPMethod.download:
          response = await client.download(
            request.url,
            request.savePath,
            data: request.body,
            queryParameters: request.query,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
            deleteOnError: deleteOnError,
            lengthHeader: lengthHeader,
          );
          break;
      }

      return response.data;
    } on DioException catch (e) {
      if (e.isConnectionError) {
        //TODO: Handle connection
        throw ApiException.connection(
          details: e.toString(),
          response: e,
        );
      } else if (e.isBadCertificate) {
        //TODO: Handle badCertificate
        throw ApiException.badCertificate(
          details: e.toString(),
          response: e,
        );
      } else if (e.isConnectTimeout) {
        //TODO: Handle connectTimeout
        throw ApiException.connectTimeOut(
          details: e.toString(),
          response: e,
        );
      } else if (e.isSendTimeout) {
        //TODO: Handle sendTimeout
        throw ApiException.sendTimeOut(
          details: e.toString(),
          response: e,
        );
      } else if (e.isReceiveTimeout) {
        //TODO: Handle receiveTimeout
        throw ApiException.receiveTimeOut(
          details: e.toString(),
          response: e,
        );
      } else if (e.isCancel) {
        //TODO: Handle cancel
        throw ApiException.cancel(
          details: e.toString(),
          response: e,
        );
      } else if (e.isBadResponse) {
        //TODO: has response
        throw ApiException.response(
          details: e.toString(),
          statusCode: e.response?.statusCode,
          statusMessage: e.response?.statusMessage,
          response: e.response?.data,
        );
      } else {
        //TODO: Handle other
        throw ApiException.other(
          details: e.toString(),
          response: e,
        );
      }
    } catch (e) {
      //TODO: Handle undefined
      throw ApiException.undefined(
        details: e.toString(),
        response: e,
      );
    }
  }
}

extension DioErrorX on DioException {
  bool get isConnectionError => type == DioExceptionType.connectionError;

  bool get isBadCertificate => type == DioExceptionType.badCertificate;

  bool get isConnectTimeout => type == DioExceptionType.connectionTimeout;

  bool get isSendTimeout => type == DioExceptionType.sendTimeout;

  bool get isReceiveTimeout => type == DioExceptionType.receiveTimeout;

  bool get isCancel => type == DioExceptionType.cancel;

  bool get isUnknownError => type == DioExceptionType.unknown;

  bool get isBadResponse => type == DioExceptionType.badResponse;
}
