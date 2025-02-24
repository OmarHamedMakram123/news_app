import 'package:app_5_news_app/src/data/data_source/local_data_source/model/news_cached_model/news_cached_model.dart';
import 'package:app_5_news_app/src/domain/entities/news_entity.dart';
import 'package:injectable/injectable.dart';

import '../model/response/news_response_model/news_response_model.dart';


abstract class NewsMapper {
  List<NewsEntity>toNewsEntity(NewsResponseModel newsResponseModel);
  List<NewsCachedModel>toListNewsCachedModel(List<NewsEntity>newsEntity);
  List<NewsEntity>toNewListCachedEntity(List<NewsCachedModel>newsCachedModel);
}
@Injectable(as: NewsMapper)
class NewsMapperImpl extends NewsMapper {
  @override
  List<NewsCachedModel> toListNewsCachedModel(List<NewsEntity> newsEntity) {
    if(newsEntity.isEmpty) return [];
    return newsEntity.map((e) => NewsCachedModel(
      sourceName: e.sourceName,
      title: e.title,
      description: e.description,
      author: e.author,
      url: e.url,
      urlToImage: e.urlToImage,
      publishedAt: e.publishedAt,
      content: e.content
    )).toList();
  }

  @override
  List<NewsEntity> toNewListCachedEntity(List<NewsCachedModel> newsCachedModel) {
    if (newsCachedModel.isEmpty) return [];
    return newsCachedModel.map((e) => NewsEntity(
      author: e.author,
      content: e.content,
      description: e.description,
      publishedAt: e.publishedAt,
      sourceName: e.sourceName,
      title: e.title,
      url: e.url,
      urlToImage: e.urlToImage
    )).toList();

  }

  @override
  List<NewsEntity> toNewsEntity(NewsResponseModel newsResponseModel) {
    if (newsResponseModel.articles == null) return [];
    return newsResponseModel.articles!.map((e) => NewsEntity(
      author: e.author ?? "",
      content: e.content ?? "",
      description: e.description ?? "",
      publishedAt: e.publishedAt ?? "",
      sourceName: e.source!.name ?? "",
      title: e.title ?? "",
      url: e.url ?? "",
      urlToImage: e.urlToImage ?? ""
    )).toList();
  }



}

