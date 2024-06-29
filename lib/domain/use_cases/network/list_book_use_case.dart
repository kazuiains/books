import 'package:books/app/core/use_cases/param_use_case.dart';
import 'package:books/domain/entities/base/base_response.dart';
import 'package:books/domain/entities/request/book_request.dart';
import 'package:books/domain/repository/book_repository.dart';

class ListBookUseCase extends ParamUseCase<BaseResponse, BookRequest> {
  final BookRepository _repo;

  ListBookUseCase(this._repo);

  @override
  Future<BaseResponse> execute(params) {
    return _repo.listBook(params);
  }
}
