import 'package:app_5_news_app/src/domain/entities/news_entity.dart';
abstract class NewsLocalDataSource {
  Future<void> cacheNewsList(List<NewsEntity> sources);
  Future<List<NewsEntity>> getCachedSourcesList();


}