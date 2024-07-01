import 'package:books/domain/entities/base/base_response.dart';
import 'package:books/domain/entities/response/book.dart';

abstract class BookRepository {
  Future<BaseResponse> listBook(
    dynamic data,
  );

  Future<dynamic> readBook(
    dynamic data,
    String uri,
  );

  Future<bool> updateBook(
    dynamic data,
  );

  Future<List<Book>> listFavorite();
}
