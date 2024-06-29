import 'package:books/domain/entities/base/base_response.dart';

abstract class BookRepository {
  Future<BaseResponse> listBook(
    dynamic data,
  );

  Future<dynamic> readBook(
    String data,
  );
}
