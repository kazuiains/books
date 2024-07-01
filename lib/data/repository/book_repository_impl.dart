import 'package:books/app/core/network/network_info.dart';
import 'package:books/data/models/request/book_request_model.dart';
import 'package:books/data/models/response/book_model.dart';
import 'package:books/data/providers/database/sources/book_local_data_source.dart';
import 'package:books/data/providers/network/sources/book_remote_data_source.dart';
import 'package:books/domain/entities/base/base_response.dart';
import 'package:books/domain/entities/response/book.dart';
import 'package:books/domain/repository/book_repository.dart';

class BookRepositoryImpl implements BookRepository {
  final BookRemoteDataSource remoteDataSource;
  final BookLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  BookRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<BaseResponse> listBook(data) async {
    final request = BookRequestModel.fromDynamic(data);
    bool isConnected = await networkInfo.isConnected;

    if (isConnected) {
      var response = await remoteDataSource.listBook(request);
      localDataSource.backupBook(response.results, data.page);
      return response;
    } else {
      return localDataSource.listBook(request);
    }
  }

  @override
  Future<dynamic> readBook(data, String uri) async {
    final book = BookModel.fromDynamic(data);
    bool isConnected = await networkInfo.isConnected;

    if (isConnected) {
      var response = await remoteDataSource.readBook(uri);
      localDataSource.updateBook(
        BookModel.fromEntity(
          book.copyWith(
            html: response,
          ),
        ),
      );
      return response;
    } else {
      return book.html;
    }
  }

  @override
  Future<List<Book>> listFavorite() {
    return localDataSource.listFavorite();
  }

  @override
  Future<bool> updateBook(data) {
    final request = BookModel.fromDynamic(data);
    return localDataSource.updateBook(request);
  }
}
