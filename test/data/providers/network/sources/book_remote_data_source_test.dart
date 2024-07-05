import 'dart:convert';

import 'package:books/app/config/app_config.dart';
import 'package:books/app/exception/api_exception.dart';
import 'package:books/data/models/request/book_request_model.dart';
import 'package:books/data/models/response/book_model.dart';
import 'package:books/data/providers/network/sources/book_remote_data_source.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'book_remote_data_source_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late BookRemoteDataSourceImpl dataSource;

  setUp(() {
    AppConfig(flavor: Flavor.development);
    mockDio = MockDio();
    dataSource = BookRemoteDataSourceImpl(dio: mockDio);
  });

  group(
    'listBook',
    () {
      test(
        'checking the http request method get function call',
        () async {
          // Mock data and response
          const url = '/books';
          final bookListJson = json.decode(fixture('remote/book_list.json'));
          final response = Response(
            data: bookListJson,
            statusCode: 200,
            requestOptions: RequestOptions(path: url),
          );

          // arrange
          when(
            mockDio.get(
              url,
              queryParameters: anyNamed('queryParameters'),
              options: anyNamed('options'),
              cancelToken: anyNamed('cancelToken'),
              onReceiveProgress: anyNamed('onReceiveProgress'),
            ),
          ).thenAnswer(
            (_) async => response,
          );

          // act
          dataSource.listBook(
            BookRequestModel(page: "1"),
          );

          // assert
          verify(
            mockDio.get(
              url,
              queryParameters: anyNamed('queryParameters'),
              options: anyNamed('options'),
              cancelToken: anyNamed('cancelToken'),
              onReceiveProgress: anyNamed('onReceiveProgress'),
            ),
          ).called(1);
        },
      );

      test(
        'fetch data list by default.',
        () async {
          // Mock data and response
          const url = '/books';
          final bookListJson = json.decode(fixture('remote/book_list.json'));
          final response = Response(
            data: bookListJson,
            statusCode: 200,
            requestOptions: RequestOptions(path: url),
          );

          // arrange
          when(
            mockDio.get(
              url,
              queryParameters: anyNamed('queryParameters'),
              options: anyNamed('options'),
              cancelToken: anyNamed('cancelToken'),
              onReceiveProgress: anyNamed('onReceiveProgress'),
            ),
          ).thenAnswer(
            (_) async => response,
          );

          // act
          final result = await dataSource.listBook(
            BookRequestModel(page: "1"),
          );

          // assert
          expect(
            result.toJson(
              (data) {
                return data != null && data.isNotEmpty
                    ? data
                        .map<Map<String, dynamic>>(
                          (i) => BookModel.fromEntity(i).toJson(),
                        )
                        .toList()
                    : [];
              },
            ),
            bookListJson,
          );
        },
      );

      test(
        'fetch data list by search title',
        () async {
          // Mock data and response
          const url = '/books';
          final bookListJson = json.decode(fixture('remote/book_search.json'));
          final response = Response(
            data: bookListJson,
            statusCode: 200,
            requestOptions: RequestOptions(path: url),
          );

          // arrange
          when(
            mockDio.get(
              url,
              queryParameters: anyNamed('queryParameters'),
              options: anyNamed('options'),
              cancelToken: anyNamed('cancelToken'),
              onReceiveProgress: anyNamed('onReceiveProgress'),
            ),
          ).thenAnswer(
            (_) async => response,
          );

          // act
          final result = await dataSource.listBook(
            BookRequestModel(search: "superman"),
          );

          // assert
          expect(
            result.toJson(
              (data) {
                return data != null && data.isNotEmpty
                    ? data
                        .map<Map<String, dynamic>>(
                          (i) => BookModel.fromEntity(i).toJson(),
                        )
                        .toList()
                    : [];
              },
            ),
            bookListJson,
          );
        },
      );

      test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
          // Mock data and response
          const url = '/books';
          final responseJson = {"detail": "Invalid page."};
          final errorResponse = DioException(
            requestOptions: RequestOptions(path: url),
            response: Response(
              data: responseJson,
              statusCode: 404,
              requestOptions: RequestOptions(path: url),
            ),
            type: DioExceptionType.badResponse,
          );

          // arrange
          when(
            mockDio.get(
              url,
              queryParameters: anyNamed('queryParameters'),
              options: anyNamed('options'),
              cancelToken: anyNamed('cancelToken'),
              onReceiveProgress: anyNamed('onReceiveProgress'),
            ),
          ).thenThrow(
            errorResponse,
          );

          // act
          final call = dataSource.listBook;

          // assert
          expect(
            () => call(
              BookRequestModel(page: "2", languages: "id"),
            ),
            throwsA(isA<ApiException>()),
          );
        },
      );
    },
  );

  group(
    'readBook',
    () {
      test(
        'get html content book.',
        () async {
          // Mock data and response
          const url = 'https://www.gutenberg.org/ebooks/17013.html.images';
          const urlPath = '/ebooks/17013.html.images';
          final bookHtml = fixture('remote/book.html');
          final response = Response(
            data: bookHtml,
            statusCode: 200,
            requestOptions: RequestOptions(path: urlPath),
            statusMessage: 'OK',
            headers: Headers.fromMap(
              {
                'content-type': ['text/html']
              },
            ),
          );

          // arrange
          when(
            mockDio.get(
              urlPath,
              queryParameters: anyNamed('queryParameters'),
              options: anyNamed('options'),
              cancelToken: anyNamed('cancelToken'),
              onReceiveProgress: anyNamed('onReceiveProgress'),
            ),
          ).thenAnswer(
            (_) async => response,
          );

          // act
          final result = await dataSource.readBook(url);

          // assert
          expect(result, contains('</html>'));
          expect(result, contains('</body>'));
          expect(result, bookHtml);
        },
      );
      test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
          // Mock data and response
          const url = 'https://www.gutenberg.org/ebooks/17013.html.images';
          const urlPath = '/ebooks/17013.html.images';
          final responseJson = {"detail": "Invalid page."};
          final errorResponse = DioException(
            requestOptions: RequestOptions(path: urlPath),
            response: Response(
              data: responseJson,
              statusCode: 404,
              requestOptions: RequestOptions(path: urlPath),
            ),
            type: DioExceptionType.badResponse,
          );

          // arrange
          when(
            mockDio.get(
              url,
              queryParameters: anyNamed('queryParameters'),
              options: anyNamed('options'),
              cancelToken: anyNamed('cancelToken'),
              onReceiveProgress: anyNamed('onReceiveProgress'),
            ),
          ).thenThrow(
            errorResponse,
          );

          // act
          final call = dataSource.readBook;

          // assert
          expect(
            () => call(
              url,
            ),
            throwsA(isA<ApiException>()),
          );
        },
      );
    },
  );
}
