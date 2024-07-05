import 'package:books/data/models/base/base_response_model.dart';
import 'package:books/data/models/request/book_request_model.dart';
import 'package:books/data/models/response/book_model.dart';
import 'package:books/data/providers/network/api_data_source.dart';
import 'package:books/data/providers/network/api_endpoint.dart';

abstract class BookRemoteDataSource {
  Future<BaseResponseModel> listBook(
    BookRequestModel data,
  );

  Future<String> readBook(String data);
}

class BookRemoteDataSourceImpl extends ApiDataSource implements BookRemoteDataSource {
  BookRemoteDataSourceImpl({
    super.dio,
  });

  @override
  Future<BaseResponseModel> listBook(BookRequestModel data) async {
    final response = await execute(
      urlPath: ApiEndpoint.books,
      params: data.toParam(),
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
  Future<String> readBook(String data) async {
    Uri uri = Uri.parse(data);

    return await execute(
      urlPath: uri.path,
    );
  }
}
