import 'package:books/data/models/request/book_request_model.dart';
import 'package:books/data/providers/network/sources/book_remote_data_source.dart';
import 'package:books/domain/entities/base/base_response.dart';
import 'package:books/domain/repository/book_repository.dart';

class BookRepositoryImpl implements BookRepository {
  final BookRemoteDataSource remoteDataSource;

  BookRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<BaseResponse> listBook(data) {
    final request = BookRequestModel.fromDynamic(data);
    return remoteDataSource.listBook(request);
  }

  @override
  Future<dynamic> readBook(String data) {
    return remoteDataSource.readBook(data);
  }
}
