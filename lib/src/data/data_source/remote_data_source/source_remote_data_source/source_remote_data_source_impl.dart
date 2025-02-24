import 'package:app_5_news_app/src/data/data_source/remote_data_source/source_remote_data_source/source_remote_data_source.dart';
import 'package:app_5_news_app/src/data/mappers/source_mapper.dart';
import 'package:app_5_news_app/src/domain/entities/source_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../api/api_manger.dart';

@Injectable(as: SourceRemoteDataSource)
class SourceRemoteDataSourceImpl implements SourceRemoteDataSource {
  final ApiManger apiManger;
  final SourceMapper sourceMapper;
  SourceRemoteDataSourceImpl(this.apiManger, this.sourceMapper);
  @override
  Future<List<SourceEntity>> getSources({required String categoryId}) async {
    final sourceResponseModel =
        await apiManger.getSources(categoryId: categoryId);
    return sourceMapper.toSourceEntity(sourceResponseModel);
  }
}
