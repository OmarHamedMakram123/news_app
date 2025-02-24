import 'package:app_5_news_app/src/domain/entities/news_entity.dart';
abstract class NewsRemoteDataSource {
  Future<List<NewsEntity>> getNews({required String  sourceId });
}