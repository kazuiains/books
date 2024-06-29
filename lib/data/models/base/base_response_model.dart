import 'package:books/domain/entities/base/base_response.dart';

class BaseResponseModel extends BaseResponse {
  BaseResponseModel({
    super.count,
    super.next,
    super.previous,
    super.results,
  });

  _initFromEntity(BaseResponse entity) {
    count = entity.count;
    next = entity.next;
    previous = entity.previous;
    results = entity.results;
  }

  BaseResponseModel.fromDynamic(dynamic dynamicEntity) {
    var dataEntity = (dynamicEntity as BaseResponse);
    _initFromEntity(dataEntity);
  }

  BaseResponseModel.fromEntity(BaseResponse entity) {
    _initFromEntity(entity);
  }

  BaseResponseModel.fromJson(
    dynamic json,
    Function(dynamic data) response,
  ) {
    if (json != null) {
      count = json['count'];
      next = json['next'];
      previous = json['previous'];

      var jsonResult = json[json['results']];
      if (jsonResult != null) {
        results = response(jsonResult);
      }
    }
  }
}
