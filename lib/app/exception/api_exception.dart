import 'package:get/get_utils/get_utils.dart';
import 'package:books/app/config/app_strings.dart';
import 'package:books/app/config/localizations/translation_key.dart';
import 'package:books/app/exception/app_exception.dart';

class ApiException extends AppException {
  ApiException({
    super.code,
    super.message,
    super.details,
    super.statusCode,
    super.statusMessage,
    super.response,
  }) : super(
          from: AppStrings.fromAppExceptionApi,
        );

  ApiException.connection({
    String? details,
    dynamic response,
  }) : this(
          code: AppStrings.codeAEConnection,
          message: messageAEConnection.tr,
          details: details,
          response: response,
        );

  ApiException.connectTimeOut({
    String? details,
    dynamic response,
  }) : this(
          code: AppStrings.codeAEConnectTimeOut,
          message: messageAEConnectTimeOut.tr,
          details: details,
          response: response,
        );

  ApiException.badCertificate({
    String? details,
    dynamic response,
  }) : this(
          code: AppStrings.codeAEBadCertificate,
          message: messageAEBadCertificate.tr,
          details: details,
          response: response,
        );

  ApiException.sendTimeOut({
    String? details,
    dynamic response,
  }) : this(
          code: AppStrings.codeAESendTimeOut,
          message: messageAESendTimeOut.tr,
          details: details,
          response: response,
        );

  ApiException.receiveTimeOut({
    String? details,
    dynamic response,
  }) : this(
          code: AppStrings.codeAEReceiveTimeOut,
          message: messageAEReceiveTimeOut.tr,
          details: details,
          response: response,
        );

  ApiException.cancel({
    String? details,
    dynamic response,
  }) : this(
          code: AppStrings.codeAECancel,
          message: messageAECancel.tr,
          details: details,
          response: response,
        );

  ApiException.response({
    String? details,
    int? statusCode,
    String? statusMessage,
    dynamic response,
  }) : this(
          code: AppStrings.codeAEResponse,
          message: messageAEResponse.tr,
          details: details,
          statusCode: statusCode,
          statusMessage: statusMessage,
          response: response,
        );

  ApiException.other({
    String? details,
    dynamic response,
  }) : this(
          code: AppStrings.codeAEOther,
          message: messageAEOther.tr,
          details: details,
          response: response,
        );

  ApiException.undefined({
    String? details,
    dynamic response,
  }) : this(
          code: AppStrings.codeAEUndefined,
          message: messageAEUndefined.tr,
          details: details,
          response: response,
        );
}
