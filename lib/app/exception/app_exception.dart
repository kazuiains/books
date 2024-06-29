class AppException implements Exception {
  final String? code;
  final String? message;
  final String? details;
  final String? from;
  final int? statusCode;
  final String? statusMessage;
  final dynamic response;

  AppException({
    this.code,
    this.message,
    this.details,
    this.from,
    this.statusCode,
    this.statusMessage,
    this.response,
  });

  AppException copyWith({
    String? code,
    String? message,
    String? details,
    String? from,
    int? statusCode,
    String? statusMessage,
    dynamic response,
  }) =>
      AppException(
        code: code ?? this.code,
        message: message ?? this.message,
        details: details ?? this.details,
        from: from ?? this.from,
        statusCode: statusCode ?? this.statusCode,
        statusMessage: statusMessage ?? this.statusMessage,
        response: response ?? this.response,
      );

  @override
  String toString() {
    return "[$from - $code]: $message | $details/n error or response: $response ";
  }
}
