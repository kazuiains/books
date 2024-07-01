import 'package:books/app/core/use_cases/param_use_case.dart';
import 'package:books/domain/entities/response/book.dart';
import 'package:books/domain/repository/book_repository.dart';

class UpdateBookUseCase extends ParamUseCase<bool, Book> {
  final BookRepository _repo;

  UpdateBookUseCase(this._repo);

  @override
  Future<bool> execute(params) {
    return _repo.updateBook(params);
  }
}
