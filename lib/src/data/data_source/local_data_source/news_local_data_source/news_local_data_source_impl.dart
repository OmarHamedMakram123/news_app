import 'package:app_5_news_app/src/data/data_source/local_data_source/model/news_cached_model/news_cached_model.dart';
import 'package:app_5_news_app/src/domain/entities/news_entity.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import '../../../mappers/news_mapper.dart';
import 'news_local_data_source.dart';

@Injectable(as: NewsLocalDataSource)
class NewsLocalDataSourceImpl  implements NewsLocalDataSource{
  final NewsMapper _newsMapper;
  NewsLocalDataSourceImpl(this._newsMapper);

 final String _key = "news";
  Future<Box<NewsCachedModel>> _box() async {
    if (!Hive.isBoxOpen(_key)) {
      await Hive.openBox<NewsCachedModel>(_key);
    }
    return Hive.box<NewsCachedModel>(_key);
  }
  Future<int> _clearSource() async {
    final sourceBox = await _box();
    return await sourceBox.clear();
  }

  @override
  Future<void> cacheNewsList(List<NewsEntity> news) async{
    final newsCachedModelBox = await _box();
    await _clearSource();
    await newsCachedModelBox.addAll(_newsMapper.toListNewsCachedModel(news));
  }

  @override
  Future<List<NewsEntity>> getCachedSourcesList() async{
    final newsCachedModelBox = await _box();
    if (newsCachedModelBox.isEmpty) return [];
    List<NewsCachedModel> newsCachedModel = newsCachedModelBox.values.toList();
    List<NewsEntity> newsEntity = _newsMapper.toNewListCachedEntity(newsCachedModel);
    return newsEntity;
  }
}