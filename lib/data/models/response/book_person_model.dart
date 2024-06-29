import 'dart:convert';

import 'package:books/domain/entities/response/book_person.dart';

BookPersonModel authorsFromJson(String str) => BookPersonModel.fromJson(json.decode(str));

String authorsToJson(BookPersonModel data) => json.encode(data.toJson());

class BookPersonModel extends BookPerson {
  BookPersonModel({
    super.name,
    super.birthYear,
    super.deathYear,
  });

  _initFromEntity(BookPerson entity) {
    name = entity.name;
    birthYear = entity.birthYear;
    deathYear = entity.deathYear;
  }

  BookPersonModel.fromDynamic(dynamic dynamicEntity) {
    var dataEntity = (dynamicEntity as BookPerson);
    _initFromEntity(dataEntity);
  }

  BookPersonModel.fromEntity(BookPerson entity) {
    _initFromEntity(entity);
  }

  BookPersonModel.fromJson(dynamic json) {
    if (json != null) {
      name = json['name'];
      birthYear = json['birth_year'];
      deathYear = json['death_year'];
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (name != null) {
      map['name'] = name;
    }
    if (birthYear != null) {
      map['birth_year'] = birthYear;
    }
    if (deathYear != null) {
      map['death_year'] = deathYear;
    }
    return map;
  }
}
