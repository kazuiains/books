class BookRequest {
  String? page;
  String? authorYearStart;
  String? authorYearEnd;
  String? copyright;
  String? languages;
  String? mimeType;
  String? search;
  String? sort;
  String? topic;

  BookRequest({
    this.page,
    this.authorYearStart,
    this.authorYearEnd,
    this.copyright,
    this.languages,
    this.mimeType,
    this.search,
    this.sort,
    this.topic,
  });

  BookRequest copyWith({
    String? page,
    String? authorYearStart,
    String? authorYearEnd,
    String? copyright,
    String? languages,
    String? mimeType,
    String? search,
    String? sort,
    String? topic,
  }) =>
      BookRequest(
        page: page ?? this.page,
        authorYearStart: authorYearStart ?? this.authorYearStart,
        authorYearEnd: authorYearEnd ?? this.authorYearEnd,
        copyright: copyright ?? this.copyright,
        languages: languages ?? this.languages,
        mimeType: mimeType ?? this.mimeType,
        search: search ?? this.search,
        sort: sort ?? this.sort,
        topic: topic ?? this.topic,
      );
}
