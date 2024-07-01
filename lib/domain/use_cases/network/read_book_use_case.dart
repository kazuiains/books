import 'package:books/app/core/use_cases/param_use_case.dart';
import 'package:books/domain/entities/response/book.dart';
import 'package:books/domain/repository/book_repository.dart';

class ReadBookUseCase extends ParamUseCase<dynamic, Params> {
  final BookRepository _repo;

  ReadBookUseCase(this._repo);

  @override
  Future<dynamic> execute(params) {
    return _repo.readBook(params.book, params.uri);
  }
}

class Params {
  final Book book;
  final String uri;

  Params({
    required this.book,
    required this.uri,
  });
}
