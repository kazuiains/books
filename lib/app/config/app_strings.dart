class AppStrings {
  //form
  static const String defaultNaValue = "NA";
  static const String defaultNullValue = "-";
  static const String zeroValue = "0";
  static const String notApplicableCodeValue = "N/A";
  static const String nullTextValue = "null";

  //regex
  static const String regexHttpsUrl = "https://";
  static const String regexHttpUrl = "http://";
  static const String regexCharger = ":|:";
  static const String regexDot = ".";

  //language
  static const String languageIdIndonesia = "id_ID";
  static const String languageIdEnglish = "en_US";

  static const String languageLanguageIndonesia = "id";
  static const String languageLanguageEnglish = "en";

  static const String languageCountryIndonesia = "ID";
  static const String languageCountryEnglish = "US";

  //duration
  static const String durationZeroTwoValue = "00:00";
  static const String durationZeroThreeValue = "00:00:00";

  //Currency
  static const String currencyIndonesiaMoney = "Rp";

  //network
  static const String httpMethodGet = "get";
  static const String httpMethodPost = "post";
  static const String httpMethodDelete = "delete";
  static const String httpMethodPatch = "patch";
  static const String httpMethodPut = "put";
  static const String httpMethodDownload = "download";

  //http request
  static const String httpRequestStatusCodeReadSuccess = "200";
  static const String httpRequestStatusCodeInsertSuccess = "201";

  //exception type
  static const String fromAppExceptionApi = "API";

  //api exception
  static const String codeAEConnection = "ae-connection";
  static const String codeAEConnectTimeOut = "ae-connect-time-out";
  static const String codeAEBadCertificate = "ae-bad-certificate";
  static const String codeAESendTimeOut = "ae-send-time-out";
  static const String codeAEReceiveTimeOut = "ae-receive-time-out";
  static const String codeAECancel = "ae-cancel";
  static const String codeAEResponse = "ae-response";
  static const String codeAEOther = "ae-other";
  static const String codeAEUndefined = "ae-undefined";
  static const String codeAEServerError = "ae-server-error";

  //global exception
  static const String globalExceptionNoInternet = "network_error";
}
