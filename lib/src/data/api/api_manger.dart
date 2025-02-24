
import 'package:app_5_news_app/core/network/api/api_constants.dart';
import 'package:app_5_news_app/core/network/api/end_points.dart';
import 'package:app_5_news_app/src/data/model/response/news_response_model/news_response_model.dart';
import 'package:app_5_news_app/src/data/model/response/search_response_model/search_response_model.dart';
import 'package:app_5_news_app/src/data/model/response/source_response_model/source_response_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_manger.g.dart';

@injectable
@singleton
@RestApi(baseUrl: ApiConstants.besUrl)
abstract class ApiManger {
  @factoryMethod
  factory ApiManger(Dio dio) = _ApiManger;
  
   @GET(EndPoints.source)
  Future<SourceResponseModel> getSources({@Query("category") required String  categoryId});


  @GET(EndPoints.news)
  Future<NewsResponseModel> getNews({@Query("sources") required String  sourcesId});

  @GET(EndPoints.search)
  Future<SearchResponseModel> search({@Query("q") required String  q});


}