import 'package:app_5_news_app/core/network/common/result.dart';
import 'package:app_5_news_app/src/data/data_source/local_data_source/source_local_data_source/source_local_data_source.dart';
import 'package:app_5_news_app/src/data/data_source/remote_data_source/source_remote_data_source/source_remote_data_source.dart';
import 'package:app_5_news_app/src/domain/entities/source_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../core/network/common/network_request_handler.dart';
import '../../domain/repositories/source_repository.dart';

@Injectable(as: SourceRepository)
class SourceRepositoryImpl  implements SourceRepository{
  final SourceRemoteDataSource _sourceRemoteDataSource;
  final SourceLocalDataSource _sourceLocalDataSource;
  final InternetConnectionChecker _internetConnectionChecker;
  SourceRepositoryImpl(this._sourceRemoteDataSource, this._sourceLocalDataSource, this._internetConnectionChecker);
  @override
  Future<Result<List<SourceEntity>>> getSources({required String categoryId}) async{
    return executeRequest<List<SourceEntity>>(methodCall: ()async {
      if(await _internetConnectionChecker.hasConnection){
        var sources=await _sourceRemoteDataSource.getSources(categoryId: categoryId);
        _sourceLocalDataSource.cacheSourcesList(sources);
        return sources;
      }else{
        return await _sourceLocalDataSource.getCachedSourcesList();
      }
    },);

      }
}