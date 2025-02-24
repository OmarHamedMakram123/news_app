import 'package:app_5_news_app/core/network/common/network_request_handler.dart';
import 'package:app_5_news_app/core/network/common/result.dart';
import 'package:app_5_news_app/src/data/data_source/remote_data_source/search_remote_data_source/search_remote_data_source.dart';
import 'package:app_5_news_app/src/domain/entities/news_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/search_repository.dart';
@Injectable(as: SearchRepository)
class SearchRepositoryImpl  implements SearchRepository{
  final SearchRemoteDataSource searchRemoteDataSource;
  SearchRepositoryImpl({required this.searchRemoteDataSource});
  @override
  Future<Result<List<NewsEntity>>> searchNews({required String q})async {
    return executeRequest(methodCall: () async {
      return searchRemoteDataSource.searchNews(q: q);
    } ,);
  }
}