import 'package:app_5_news_app/src/domain/repositories/search_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../core/network/common/result.dart';
import '../entities/news_entity.dart';

@injectable
class GetSearchUseCase {
  final SearchRepository searchRepository;
  GetSearchUseCase({required this.searchRepository});

  Future<Result<List<NewsEntity>>> searchNews({required String q}) async {
    return await searchRepository.searchNews(q: q);
  }

}