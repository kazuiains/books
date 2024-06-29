import 'package:books/app/config/localizations/translation_key.dart';

class EnUS {
  static const String tryAgain = "Try Again";
  static const String errorTitleConnection = "Not Connected";
  static const String errorTitleDataNotFound = "Data not Found";
  static const String errorTitleNotFound = "Not Found";
  static const String errorTitleSystemError = "There is an Error";
  static const String errorTitleServerError = "There is an Error";
  static const String errorSubtitleConnection = "Your internet has a problem. Please check your internet or Wi-Fi connection then try again.";
  static const String errorSubtitleDataNotFound = "The data you requested could not be found. Please check again and try again.";
  static const String errorSubtitleNotFound = "The action you took is temporarily not found. please contact us.";
  static const String errorSubtitleSystemError = "An error occurred in the system. please try again a few moments later.";
  static const String errorSubtitleServerError = "An error occurred on the server. please try again a few moments later.";

  static const String noConnection = "No connection";
  static const String noConnectionDescription = "Make sure you are connected to the internet network.";

  static const String loading = "Loading";
  static const String pleaseWait = "Please Wait";
  static const String developmentTitle = "Under Development";
  static const String developmentSubtitle = "Sorry, this feature is not accessible because it is currently under development. Thank You.";

  static const String indonesian = "Indonesian";
  static const String english = "English";

  static const String success = "Success";
  static const String warning = "Warning";
  static const String error = "Error";
  static const String notification = "Notification";
  static const String close = "Close";
  static const String yes = "Yes";
  static const String no = "No";
  static const String ok = "Ok";

  static const String messageExceptionConnection = "Unable to connect with server.";
  static const String messageExceptionConnectTimeOut = "Failed to connect with the server because of Time Out.";
  static const String messageExceptionBadCertificate = "Failed to connect with the server because of Certificate.";
  static const String messageExceptionSendTimeOut = "Failed to send data to the server because of Time Out.";
  static const String messageExceptionReceiveTimeOut = "Failed to get data from the server because of Time Out.";
  static const String messageExceptionCancel = "The request to the server was cancelled.";
  static const String messageExceptionResponse = "Get response data from the server.";
  static const String messageExceptionOther = "There was another error trying to make a request to the server.";
  static const String messageExceptionUndefined = "An internal error has occurred in the system";

  static const String mustBeFilled = "Must be filled";
  static const String incorrectFormat = "Incorrect format";
  static const String newPasswordNotMatchEtc = "New Password and Confirm Password are not the same";
  static const String cannotBeFilled0 = "Cannot be filled 0";
  static const String exceededMax = "Exceeded max";
  static const String containsAtLeastNCharacters = "Contains at least 6 characters";

  static Map<String, String> get messages => {
        baseLoadingAndErrorRefreshButton: tryAgain.toUpperCase(),
        baseLoadingAndErrorErrorTitle1: errorTitleConnection,
        baseLoadingAndErrorErrorTitle2: errorTitleDataNotFound,
        baseLoadingAndErrorErrorTitle3: errorTitleNotFound,
        baseLoadingAndErrorErrorTitle4: errorTitleSystemError,
        baseLoadingAndErrorErrorTitle5: errorTitleServerError,
        baseLoadingAndErrorErrorMessage1: errorSubtitleConnection,
        baseLoadingAndErrorErrorMessage2: errorSubtitleDataNotFound,
        baseLoadingAndErrorErrorMessage3: errorSubtitleNotFound,
        baseLoadingAndErrorErrorMessage4: errorSubtitleSystemError,
        baseLoadingAndErrorErrorMessage5: errorSubtitleServerError,
        baseErrorTitle1: noConnection,
        baseErrorMessage1: noConnectionDescription,
        generalLoading: "$loading...",
        generalPleaseWait: "$pleaseWait...",
        generalDevelopmentTitle: developmentTitle,
        generalDevelopmentSubtitle: developmentSubtitle,
        language1: indonesian,
        language2: english,
        modalTitleSuccess: success,
        modalTitleError: error,
        modalTitleWarning: warning,
        modalTextYes: yes.toUpperCase(),
        modalTextNo: no.toUpperCase(),
        modalTextOk: ok.toUpperCase(),
        snackBarTitleSuccess: success,
        snackBarTitleError: error,
        snackBarTitleWarning: warning,
        snackBarTitleNotification: notification,
        snackBarTextClose: close.toUpperCase(),
        bottomSheetTextOk: ok.toUpperCase(),
        messageAEConnection: messageExceptionConnection,
        messageAEConnectTimeOut: messageExceptionConnectTimeOut,
        messageAEBadCertificate: messageExceptionBadCertificate,
        messageAESendTimeOut: messageExceptionSendTimeOut,
        messageAEReceiveTimeOut: messageExceptionReceiveTimeOut,
        messageAECancel: messageExceptionCancel,
        messageAEResponse: messageExceptionResponse,
        messageAEOther: messageExceptionOther,
        messageAEUndefined: messageExceptionUndefined,
        validatorMessageEmptyInput: "$mustBeFilled!",
        validatorMessageInvalidFormat: "$incorrectFormat.",
        validatorMessageNewPasswordNotMatch: "$newPasswordNotMatchEtc.",
        validatorMessageMinInputNumeric: "$cannotBeFilled0.",
        validatorMessageMaxInputNumeric: "$exceededMax.",
        validatorMessageMinimumPassword: containsAtLeastNCharacters,
      };
}
