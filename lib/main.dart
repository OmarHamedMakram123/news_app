import 'package:app_5_news_app/core/utils/functions/bloc_observer/bloc_observer.dart';
import 'package:app_5_news_app/dependency_injection/di.dart';
import 'package:app_5_news_app/news_app.dart';
import 'package:app_5_news_app/src/data/data_source/local_data_source/model/news_cached_model/news_cached_model.dart';
import 'package:app_5_news_app/src/data/data_source/local_data_source/model/source_cached_model/source_cached_model.dart';
import 'package:hive/hive.dart';
import 'core/app_exports.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Hive.registerAdapter(SourceCachedModelAdapter());
  Hive.registerAdapter(NewsCachedModelAdapter());
  await Hive.initFlutter();
  Bloc.observer = MyBlocObserver();
  runApp(const NewsApp());

}
