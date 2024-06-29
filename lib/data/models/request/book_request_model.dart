import 'dart:convert';

import 'package:books/domain/entities/request/book_request.dart';

String bookRequestModelToJson(BookRequestModel data) => json.encode(data.toJson());

class BookRequestModel extends BookRequest {
  BookRequestModel({
    super.page,
    super.authorYearStart,
    super.authorYearEnd,
    super.copyright,
    super.languages,
    super.mimeType,
    super.search,
    super.sort,
    super.topic,
  });

  _initFromEntity(BookRequest entity) {
    page = entity.page;
    authorYearStart = entity.authorYearStart;
    authorYearEnd = entity.authorYearEnd;
    copyright = entity.copyright;
    languages = entity.languages;
    mimeType = entity.mimeType;
    search = entity.search;
    sort = entity.sort;
    topic = entity.topic;
  }

  BookRequestModel.fromDynamic(dynamic dynamicEntity) {
    var dataEntity = (dynamicEntity as BookRequest);
    _initFromEntity(dataEntity);
  }

  BookRequestModel.fromEntity(BookRequest entity) {
    _initFromEntity(entity);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (page != null) {
      map['page'] = page;
    }
    if (authorYearStart != null) {
      map['author_year_start'] = authorYearStart;
    }
    if (authorYearEnd != null) {
      map['author_year_end'] = authorYearEnd;
    }
    if (copyright != null) {
      map['copyright'] = copyright;
    }
    if (languages != null) {
      map['languages'] = languages;
    }
    if (mimeType != null) {
      map['mime_type'] = mimeType;
    }
    if (search != null) {
      map['search'] = search;
    }
    if (sort != null) {
      map['sort'] = sort;
    }
    if (topic != null) {
      map['topic'] = topic;
    }
    return map;
  }

  Map<String, String> toParam() {
    final map = <String, String>{};
    if (page != null) {
      map['page'] = page!;
    }
    if (authorYearStart != null) {
      map['author_year_start'] = authorYearStart!;
    }
    if (authorYearEnd != null) {
      map['author_year_end'] = authorYearEnd!;
    }
    if (copyright != null) {
      map['copyright'] = copyright!;
    }
    if (languages != null) {
      map['languages'] = languages!;
    }
    if (mimeType != null) {
      map['mime_type'] = mimeType!;
    }
    if (search != null) {
      map['search'] = search!;
    }
    if (sort != null) {
      map['sort'] = sort!;
    }
    if (topic != null) {
      map['topic'] = topic!;
    }
    return map;
  }
}
