import 'package:app_5_news_app/src/data/api/api_manger.dart';
import 'package:app_5_news_app/src/data/data_source/remote_data_source/search_remote_data_source/search_remote_data_source.dart';
import 'package:app_5_news_app/src/domain/entities/news_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../mappers/search_mapper.dart';
@Injectable(as:SearchRemoteDataSource )
class SearchRemoteDataSourceImpl  implements SearchRemoteDataSource{
  final ApiManger _apiManger;
  final SearchMapper _searchMapper;
   SearchRemoteDataSourceImpl(this._searchMapper,this._apiManger);
  @override
  Future<List<NewsEntity>> searchNews({required String q}) async{
    var searchResponseModel=await _apiManger.search(q: q);
    return _searchMapper.toNewsEntity(searchResponseModel: searchResponseModel);
  }
}