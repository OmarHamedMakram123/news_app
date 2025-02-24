import 'package:app_5_news_app/core/network/common/result.dart';
import 'package:app_5_news_app/src/domain/entities/news_entity.dart';
import 'package:app_5_news_app/src/domain/entities/source_entity.dart';

abstract class NewsRepository   {
  Future<Result<List<NewsEntity>>>getNews({required String  sourceId});
}