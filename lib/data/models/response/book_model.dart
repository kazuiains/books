import 'dart:convert';

import 'package:books/data/models/response/book_format_model.dart';
import 'package:books/domain/entities/response/book.dart';

import 'book_person_model.dart';

BookModel bookFromJson(String str) => BookModel.fromJson(json.decode(str));

String bookToJson(BookModel data) => json.encode(data.toJson());

const String bookModelTableName = 'FileResources';
const String bookModelColumn1 = 'id';
const String bookModelColumn2 = 'title';
const String bookModelColumn3 = 'authors';
const String bookModelColumn4 = 'translators';
const String bookModelColumn5 = 'subjects';
const String bookModelColumn6 = 'bookshelves';
const String bookModelColumn7 = 'languages';
const String bookModelColumn8 = 'copyright';
const String bookModelColumn9 = 'mediaType';
const String bookModelColumn10 = 'formats';
const String bookModelColumn11 = 'downloadCount';
const String bookModelColumn12 = 'page';
const String bookModelColumn13 = 'tableId';
const String bookModelColumn14 = 'html';
const String bookModelColumn15 = 'favorite';

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
    super.page,
    super.tableId,
    super.html,
    super.favorite,
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
    page = entity.page;
    tableId = entity.tableId;
    html = entity.html;
    favorite = entity.favorite;
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

  BookModel.fromTable(dynamic json) {
    if (json != null) {
      id = json[bookModelColumn1];
      title = json[bookModelColumn2];
      if (json[bookModelColumn3] != null && json[bookModelColumn3] != "") {
        authors = [];
        for (var v in (jsonDecode(json[bookModelColumn3]) as List<dynamic>)) {
          authors?.add(
            BookPersonModel.fromJson(v),
          );
        }
      }
      if (json[bookModelColumn4] != null && json[bookModelColumn4] != "") {
        translators = [];
        for (var v in (jsonDecode(json[bookModelColumn4]) as List<dynamic>)) {
          translators?.add(
            BookPersonModel.fromJson(v),
          );
        }
      }
      subjects =
          json[bookModelColumn5] != null && json[bookModelColumn5] != "" ? (jsonDecode(json[bookModelColumn5]) as List<dynamic>).cast<String>() : [];
      bookshelves =
          json[bookModelColumn6] != null && json[bookModelColumn6] != "" ? (jsonDecode(json[bookModelColumn6]) as List<dynamic>).cast<String>() : [];
      languages =
          json[bookModelColumn7] != null && json[bookModelColumn7] != "" ? (jsonDecode(json[bookModelColumn7]) as List<dynamic>).cast<String>() : [];
      copyright = json[bookModelColumn8] == 1 ? true : false;
      mediaType = json[bookModelColumn9];
      formats = BookFormatModel.fromJson(jsonDecode(json[bookModelColumn10]));
      downloadCount = json[bookModelColumn11];
      page = json[bookModelColumn12];
      tableId = json[bookModelColumn13];
      html = json[bookModelColumn14];
      favorite = json[bookModelColumn15] == 1 ? true : false;
    }
  }

  Map<String, dynamic> toTable() {
    final map = <String, dynamic>{};
    if (id != null) {
      map[bookModelColumn1] = id;
    }
    if (title != null) {
      map[bookModelColumn2] = title;
    }
    if (authors != null) {
      map[bookModelColumn3] = jsonEncode(authors?.map((v) => BookPersonModel.fromEntity(v).toJson()).toList());
    }
    if (translators != null) {
      map[bookModelColumn4] = jsonEncode(translators?.map((v) => BookPersonModel.fromEntity(v).toJson()).toList());
    }
    if (subjects != null) {
      map[bookModelColumn5] = jsonEncode(subjects);
    }
    if (bookshelves != null) {
      map[bookModelColumn6] = jsonEncode(bookshelves);
    }
    if (languages != null) {
      map[bookModelColumn7] = jsonEncode(languages);
    }
    if (copyright != null) {
      map[bookModelColumn8] = copyright! ? 1 : 0;
    }
    if (mediaType != null) {
      map[bookModelColumn9] = mediaType;
    }
    if (formats != null) {
      map[bookModelColumn10] = jsonEncode(BookFormatModel.fromEntity(formats!).toJson());
    }
    if (downloadCount != null) {
      map[bookModelColumn11] = downloadCount;
    }
    if (downloadCount != null) {
      map[bookModelColumn11] = downloadCount;
    }
    if (page != null) {
      map[bookModelColumn12] = page;
    }
    if (tableId != null) {
      map[bookModelColumn13] = tableId;
    }
    if (html != null) {
      map[bookModelColumn14] = html;
    }
    if (favorite != null) {
      map[bookModelColumn15] = favorite! ? 1 : 0;
    }
    return map;
  }
}
