import 'package:app_5_news_app/src/data/model/response/source_response_model/source_response_model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/source_entity.dart';
import '../data_source/local_data_source/model/source_cached_model/source_cached_model.dart';

abstract class SourceMapper {
  List<SourceEntity>toSourceEntity(SourceResponseModel sourceResponseModel);
  List<SourceCachedModel>toListSourceCachedModel(List<SourceEntity>sources);
  List<SourceEntity>toListSourceEntityCached(List<SourceCachedModel>sources);
}

@Injectable(as:SourceMapper )
class SourceMapperImpl implements SourceMapper {
  @override
  List<SourceEntity> toSourceEntity(SourceResponseModel sourceResponseModel) {
    if (sourceResponseModel.sources == null) return [];
    return sourceResponseModel.sources!.map((e) => SourceEntity(
        id: e.id,
        name: e.name
    )).toList();
  }
  @override
  List<SourceCachedModel> toListSourceCachedModel(List<SourceEntity> sources) {
    return sources.map((e) => SourceCachedModel(id: e.id ?? "", name: e.name ?? "")).toList();
  }


  @override
  List<SourceEntity> toListSourceEntityCached(List<SourceCachedModel> sources) {
    return sources.map((e) => SourceEntity(id: e.id,name: e.name),).toList();
  }

}