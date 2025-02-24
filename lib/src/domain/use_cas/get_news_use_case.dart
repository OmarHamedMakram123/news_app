import 'package:app_5_news_app/core/network/common/result.dart';
import 'package:app_5_news_app/src/domain/entities/news_entity.dart';
import 'package:app_5_news_app/src/domain/repositories/news_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetNewsUseCase {
  final NewsRepository newsRepository;
  GetNewsUseCase({required this.newsRepository });

  Future<Result<List<NewsEntity>>>invoke({required String  sourceId})async{
    return await newsRepository.getNews(sourceId: sourceId);
  }
}