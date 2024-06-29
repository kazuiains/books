import 'package:books/app/core/use_cases/param_use_case.dart';
import 'package:books/domain/repository/book_repository.dart';

class ReadBookUseCase extends ParamUseCase<dynamic, String> {
  final BookRepository _repo;

  ReadBookUseCase(this._repo);

  @override
  Future<dynamic> execute(params) {
    return _repo.readBook(params);
  }
}
