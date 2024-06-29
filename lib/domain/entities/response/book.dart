import 'package:books/domain/entities/response/book_format.dart';
import 'package:books/domain/entities/response/book_person.dart';

class Book {
  num? id;
  String? title;
  List<BookPerson>? authors;
  List<BookPerson>? translators;
  List<String>? subjects;
  List<String>? bookshelves;
  List<String>? languages;
  bool? copyright;
  String? mediaType;
  BookFormat? formats;
  num? downloadCount;

  Book({
    this.id,
    this.title,
    this.authors,
    this.translators,
    this.subjects,
    this.bookshelves,
    this.languages,
    this.copyright,
    this.mediaType,
    this.formats,
    this.downloadCount,
  });

  Book copyWith({
    num? id,
    String? title,
    List<BookPerson>? authors,
    List<BookPerson>? translators,
    List<String>? subjects,
    List<String>? bookshelves,
    List<String>? languages,
    bool? copyright,
    String? mediaType,
    BookFormat? formats,
    num? downloadCount,
  }) =>
      Book(
        id: id ?? this.id,
        title: title ?? this.title,
        authors: authors ?? this.authors,
        translators: translators ?? this.translators,
        subjects: subjects ?? this.subjects,
        bookshelves: bookshelves ?? this.bookshelves,
        languages: languages ?? this.languages,
        copyright: copyright ?? this.copyright,
        mediaType: mediaType ?? this.mediaType,
        formats: formats ?? this.formats,
        downloadCount: downloadCount ?? this.downloadCount,
      );
}
