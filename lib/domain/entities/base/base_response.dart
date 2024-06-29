class BaseResponse {
  num? count;
  String? next;
  String? previous;
  dynamic results;

  BaseResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  BaseResponse copyWith({
    num? count,
    String? next,
    String? previous,
    dynamic results,
  }) =>
      BaseResponse(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results,
      );
}
