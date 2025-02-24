import 'package:app_5_news_app/src/domain/entities/news_entity.dart';

abstract class SearchRemoteDataSource {
  Future<List<NewsEntity>>searchNews({required String q});
}