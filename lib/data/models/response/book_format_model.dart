import 'dart:convert';

import 'package:books/domain/entities/response/book_format.dart';

BookFormatModel formatsFromJson(String str) => BookFormatModel.fromJson(json.decode(str));

String formatsToJson(BookFormatModel data) => json.encode(data.toJson());

class BookFormatModel extends BookFormat {
  BookFormatModel({
    super.textHtml,
    super.applicationEpubZip,
    super.applicationXMobiPocketEbook,
    super.applicationRdfXml,
    super.imageJpeg,
    super.textPlainCharsetUsaSCII,
    super.applicationOCTETStream,
  });

  _initFromEntity(BookFormat entity) {
    textHtml = entity.textHtml;
    applicationEpubZip = entity.applicationEpubZip;
    applicationXMobiPocketEbook = entity.applicationXMobiPocketEbook;
    applicationRdfXml = entity.applicationRdfXml;
    imageJpeg = entity.imageJpeg;
    textPlainCharsetUsaSCII = entity.textPlainCharsetUsaSCII;
    applicationOCTETStream = entity.applicationOCTETStream;
  }

  BookFormatModel.fromDynamic(dynamic dynamicEntity) {
    var dataEntity = (dynamicEntity as BookFormat);
    _initFromEntity(dataEntity);
  }

  BookFormatModel.fromEntity(BookFormat entity) {
    _initFromEntity(entity);
  }

  BookFormatModel.fromJson(dynamic json) {
    if (json != null) {
      textHtml = json['text/html'];
      applicationEpubZip = json['application/epub+zip'];
      applicationXMobiPocketEbook = json['application/x-mobipocket-ebook'];
      applicationRdfXml = json['application/rdf+xml'];
      imageJpeg = json['image/jpeg'];
      textPlainCharsetUsaSCII = json['text/plain; charset=us-ascii'];
      applicationOCTETStream = json['application/octet-stream'];
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (textHtml != null) {
      map['text/html'] = textHtml;
    }
    if (applicationEpubZip != null) {
      map['application/epub+zip'] = applicationEpubZip;
    }
    if (applicationXMobiPocketEbook != null) {
      map['application/x-mobipocket-ebook'] = applicationXMobiPocketEbook;
    }
    if (applicationRdfXml != null) {
      map['application/rdf+xml'] = applicationRdfXml;
    }
    if (imageJpeg != null) {
      map['image/jpeg'] = imageJpeg;
    }
    if (textPlainCharsetUsaSCII != null) {
      map['text/plain; charset=us-ascii'] = textPlainCharsetUsaSCII;
    }
    if (applicationOCTETStream != null) {
      map['application/octet-stream'] = applicationOCTETStream;
    }
    return map;
  }
}