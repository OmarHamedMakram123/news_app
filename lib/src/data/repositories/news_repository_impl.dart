import 'package:app_5_news_app/core/network/common/network_request_handler.dart';
import 'package:app_5_news_app/core/network/common/result.dart';
import 'package:app_5_news_app/src/domain/entities/news_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../domain/repositories/news_repository.dart';
import '../data_source/local_data_source/news_local_data_source/news_local_data_source.dart';
import '../data_source/remote_data_source/news_remote_data_source/news_remote_data_source.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl  implements NewsRepository {
  final NewsRemoteDataSource _newsRemoteDataSource;
  final NewsLocalDataSource _newsLocalDataSource;
  final InternetConnectionChecker _internetConnectionChecker;
  NewsRepositoryImpl(this._newsRemoteDataSource, this._newsLocalDataSource, this._internetConnectionChecker);
  @override
  Future<Result<List<NewsEntity>>> getNews({required String sourceId}) async{
    return executeRequest(methodCall: ()async {
      if(await _internetConnectionChecker.hasConnection){
        var news=await _newsRemoteDataSource.getNews(sourceId: sourceId);
        _newsLocalDataSource.cacheNewsList(news);
        return news;
      }else{
        return  await _newsLocalDataSource.getCachedSourcesList();
      }
    },);
  }
}