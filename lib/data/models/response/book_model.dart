import 'dart:convert';

import 'package:books/data/models/response/book_format_model.dart';
import 'package:books/domain/entities/response/book.dart';

import 'book_person_model.dart';

BookModel bookFromJson(String str) => BookModel.fromJson(json.decode(str));

String bookToJson(BookModel data) => json.encode(data.toJson());

class BookModel extends Book {
  BookModel({
    super.id,
    super.title,
    super.authors,
    super.translators,
    super.subjects,
    super.bookshelves,
    super.languages,
    super.copyright,
    super.mediaType,
    super.formats,
    super.downloadCount,
  });

  _initFromEntity(Book entity) {
    id = entity.id;
    title = entity.title;
    authors = entity.authors;
    translators = entity.translators;
    subjects = entity.subjects;
    bookshelves = entity.bookshelves;
    languages = entity.languages;
    copyright = entity.copyright;
    mediaType = entity.mediaType;
    formats = entity.formats;
    downloadCount = entity.downloadCount;
  }

  BookModel.fromDynamic(dynamic dynamicEntity) {
    var dataEntity = (dynamicEntity as Book);
    _initFromEntity(dataEntity);
  }

  BookModel.fromEntity(Book entity) {
    _initFromEntity(entity);
  }

  BookModel.fromJson(dynamic json) {
    if (json != null) {
      id = json['id'];
      title = json['title'];
      if (json['authors'] != null) {
        authors = [];
        json['authors'].forEach((v) {
          authors?.add(BookPersonModel.fromJson(v));
        });
      }
      if (json['translators'] != null) {
        translators = [];
        json['translators'].forEach((v) {
          translators?.add(BookPersonModel.fromJson(v));
        });
      }
      subjects = json['subjects'] != null ? json['subjects'].cast<String>() : [];
      bookshelves = json['bookshelves'] != null ? json['bookshelves'].cast<String>() : [];
      languages = json['languages'] != null ? json['languages'].cast<String>() : [];
      copyright = json['copyright'];
      mediaType = json['media_type'];
      formats = json['formats'] != null ? BookFormatModel.fromJson(json['formats']) : null;
      downloadCount = json['download_count'];
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    if (title != null) {
      map['title'] = title;
    }
    if (authors != null) {
      map['authors'] = authors?.map((v) => BookPersonModel.fromEntity(v).toJson()).toList();
    }
    if (translators != null) {
      map['translators'] = translators?.map((v) => BookPersonModel.fromEntity(v).toJson()).toList();
    }
    if (subjects != null) {
      map['subjects'] = subjects;
    }
    if (bookshelves != null) {
      map['bookshelves'] = bookshelves;
    }
    if (languages != null) {
      map['languages'] = languages;
    }
    if (copyright != null) {
      map['copyright'] = copyright;
    }
    if (mediaType != null) {
      map['media_type'] = mediaType;
    }
    if (formats != null) {
      map['formats'] = BookFormatModel.fromEntity(formats!).toJson();
    }
    if (downloadCount != null) {
      map['download_count'] = downloadCount;
    }
    return map;
  }
}
