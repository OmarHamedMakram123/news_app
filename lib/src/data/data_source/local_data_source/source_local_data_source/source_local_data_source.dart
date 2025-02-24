import '../../../../domain/entities/source_entity.dart';

abstract class SourceLocalDataSource {
  Future<List<SourceEntity>> getCachedSourcesList();
  Future<void> cacheSourcesList(List<SourceEntity> sources);
}