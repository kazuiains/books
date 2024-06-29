import 'package:dio/dio.dart';
import 'package:books/app/config/app_strings.dart';

enum HTTPMethod {
  get,
  post,
  delete,
  put,
  patch,
  download,
}

extension HTTPMethodString on HTTPMethod {
  String get string {
    switch (this) {
      case HTTPMethod.get:
        return AppStrings.httpMethodGet;
      case HTTPMethod.post:
        return AppStrings.httpMethodPost;
      case HTTPMethod.delete:
        return AppStrings.httpMethodDelete;
      case HTTPMethod.patch:
        return AppStrings.httpMethodPatch;
      case HTTPMethod.put:
        return AppStrings.httpMethodPut;
      case HTTPMethod.download:
        return AppStrings.httpMethodDownload;
    }
  }
}

abstract class APIRequestRepresentable {
  String get url;

  Map<String, String>? get headers;

  String? get contentType;

  ResponseType? get responseType;

  dynamic get body;

  Map<String, String>? get query;

  HTTPMethod get method;

  String get savePath;

  Future request();
}
