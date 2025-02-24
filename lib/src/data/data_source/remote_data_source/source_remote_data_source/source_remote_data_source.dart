import 'package:app_5_news_app/src/domain/entities/source_entity.dart';
abstract class SourceRemoteDataSource {
  Future<List<SourceEntity>> getSources({required String categoryId});
}