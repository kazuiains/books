import 'package:books/app/core/use_cases/no_param_use_case.dart';
import 'package:books/domain/entities/response/book.dart';
import 'package:books/domain/repository/book_repository.dart';

class ListFavoriteUseCase extends NoParamUseCase<List<Book>> {
  final BookRepository _repo;

  ListFavoriteUseCase(this._repo);

  @override
  Future<List<Book>> execute() {
    return _repo.listFavorite();
  }
}
