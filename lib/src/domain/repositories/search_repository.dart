import 'package:app_5_news_app/core/network/common/result.dart';

import '../entities/news_entity.dart';

abstract class SearchRepository {
  Future<Result<List<NewsEntity>>> searchNews({required String q });
}