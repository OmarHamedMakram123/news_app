import 'package:app_5_news_app/src/data/mappers/source_mapper.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/source_entity.dart';
import '../model/source_cached_model/source_cached_model.dart';
import 'source_local_data_source.dart';
@Injectable(as: SourceLocalDataSource)
class SourceLocalDataSourceImpl implements SourceLocalDataSource{
  final SourceMapper  sourceMapper;
  SourceLocalDataSourceImpl({required this.sourceMapper});
    final String _key = "sources";

  @override
  Future<void> cacheSourcesList(List<SourceEntity> sources) async {
    List<SourceCachedModel> sourceCachedModel =
    sourceMapper.toListSourceCachedModel(sources);
    final sourceBox = await _box();
    await _clearSource();
    await sourceBox.addAll(sourceCachedModel);
  }

  @override
  Future<List<SourceEntity>> getCachedSourcesList() async {
    var sourceBox = await _box();
    if (sourceBox.isEmpty) return [];
    List<SourceCachedModel> sourceCachedModel = sourceBox.values.toList();
    List<SourceEntity> sourceEntity =
    sourceMapper.toListSourceEntityCached(sourceCachedModel);
    return sourceEntity;
  }

  Future<Box<SourceCachedModel>> _box() async {
    if (!Hive.isBoxOpen(_key)) {
      await Hive.openBox<SourceCachedModel>(_key);
    }
    return Hive.box<SourceCachedModel>(_key);
  }

  Future<int> _clearSource() async {
    final sourceBox = await _box();
    return await sourceBox.clear();
  }

}