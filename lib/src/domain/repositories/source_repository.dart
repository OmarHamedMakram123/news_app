import 'package:app_5_news_app/core/network/common/result.dart';
import 'package:app_5_news_app/src/domain/entities/source_entity.dart';
 abstract class SourceRepository{
   Future<Result<List<SourceEntity>>>getSources({required String  categoryId});
 }