import 'package:app_5_news_app/src/data/data_source/remote_data_source/news_remote_data_source/news_remote_data_source.dart';
import 'package:app_5_news_app/src/domain/entities/news_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../api/api_manger.dart';
import '../../../mappers/news_mapper.dart';

@Injectable(as: NewsRemoteDataSource)
class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final ApiManger _apiManger;
  final NewsMapper _newsMapper;
  NewsRemoteDataSourceImpl(this._apiManger, this._newsMapper);
  @override
  Future<List<NewsEntity>> getNews({required String sourceId}) async{
    var newsResponseModel=await _apiManger.getNews(sourcesId: sourceId);
    return _newsMapper.toNewsEntity(newsResponseModel);
  }
}