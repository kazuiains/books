import 'package:books/data/models/base/base_response_model.dart';
import 'package:books/data/models/request/book_request_model.dart';
import 'package:books/data/models/response/book_model.dart';
import 'package:books/data/providers/network/api_data_source.dart';
import 'package:books/data/providers/network/api_endpoint.dart';
import 'package:books/data/providers/network/api_request_representable.dart';

abstract class BookRemoteDataSource {
  Future<BaseResponseModel> listBook(
    BookRequestModel data,
  );

  Future<dynamic> readBook(String data);
}

class BookRemoteDataSourceImpl extends ApiDataSource implements BookRemoteDataSource {
  @override
  Future<BaseResponseModel> listBook(BookRequestModel data) async {
    final response = await execute(
      endpoint: ApiEndpoint.books,
      params: data.toParam(),
      method: HTTPMethod.get,
    );

    return BaseResponseModel.fromJson(
      response,
      (json) => json != null && json is List && json.isNotEmpty
          ? json
              .map<BookModel>(
                (i) => BookModel.fromJson(i),
              )
              .toList()
          : [],
    );
  }

  @override
  Future<dynamic> readBook(String data) async {
    Uri uri = Uri.parse(data);

    return await execute(
      path: uri.path,
      method: HTTPMethod.get,
    );
  }
}
