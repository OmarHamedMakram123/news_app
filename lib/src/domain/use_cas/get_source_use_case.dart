import 'package:app_5_news_app/core/network/common/result.dart';
import 'package:app_5_news_app/src/domain/entities/source_entity.dart';
import 'package:app_5_news_app/src/domain/repositories/source_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSourceUseCase {
  final SourceRepository _sourceRepository;
   GetSourceUseCase(this._sourceRepository);

  Future<Result<List<SourceEntity>>>invoke({required String  categoryId})async{
    return await _sourceRepository.getSources(categoryId: categoryId);
  }
}