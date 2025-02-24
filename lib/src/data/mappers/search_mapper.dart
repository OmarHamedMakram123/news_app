import 'package:app_5_news_app/src/data/model/response/search_response_model/search_response_model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/news_entity.dart';

abstract class SearchMapper {
  List<NewsEntity> toNewsEntity({required SearchResponseModel searchResponseModel});
}

@Injectable(as: SearchMapper)
class SearchMapperImpl implements SearchMapper{
  @override
  List<NewsEntity> toNewsEntity({required SearchResponseModel searchResponseModel}) {
    if(searchResponseModel.articles == null) return [];
    return searchResponseModel.articles!.map((e) => NewsEntity(
      author: e.author ?? "",
      content: e.content ?? "",
      description: e.description ?? "",
      publishedAt: e.publishedAt ?? "",
      sourceName:e.source!.name ?? "",
      title:e.title?? "",
      urlToImage:e.urlToImage ?? "",
      url:e.url ?? "",
    )).toList();
  }
}