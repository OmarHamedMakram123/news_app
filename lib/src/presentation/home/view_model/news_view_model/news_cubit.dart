import 'package:app_5_news_app/core/network/common/result.dart';
import 'package:app_5_news_app/src/domain/entities/news_entity.dart';
import 'package:app_5_news_app/src/domain/entities/source_entity.dart';
import 'package:app_5_news_app/src/domain/use_cas/get_news_use_case.dart';
import 'package:app_5_news_app/src/domain/use_cas/get_source_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import 'news_action.dart';
part 'news_state.dart';

@injectable
class NewsCubit extends Cubit<NewsState> {
  final GetSourceUseCase _getSourceUseCase;
  final GetNewsUseCase _getNewsUseCase;
  NewsCubit(this._getNewsUseCase,this._getSourceUseCase) : super(NewsInitial());

  List<SourceEntity> sources=[];
  List<NewsEntity> news=[];


  Future<void>doAction(NewsAction action)async{
    if(action is GetSourceAction){
     return await _getSources(categoryId: action.categoryId);
    }else if(action is GetNewsAction){
     return await _getNews(sourceId: action.sourceId);
    }
  }


  Future<void>_getSources({required String categoryId})async{
    emit(GetSourceLoadingState());
    var result= await _getSourceUseCase.invoke(categoryId: categoryId);
    switch (result) {
      case Success<List<SourceEntity>>():
        sources=result.data ?? [] ;
        emit(GetSourceSuccessState());
      case Error<List<SourceEntity>>():
        emit(GetSourceErrorState(exception: result.exception));

    }
  }
  Future<void>_getNews({required String sourceId})async{
    emit(GetNewsLoadingState());
    var result= await _getNewsUseCase.invoke(sourceId: sourceId);
    switch (result) {
      case Success<List<NewsEntity>>():
        news=result.data ?? [] ;
        emit(GetNewsSuccessState());
      case Error<List<NewsEntity>>():
        emit(GetNewsErrorState(result.exception));
    }
  }


  int selectedIndexTab=0;
  void onTabSource({required int index}){
    if(selectedIndexTab==index){
      return;
    }
    selectedIndexTab=index;
    emit(ChangeSourceState());
    _getNews(sourceId: sources[index].id ?? "");
  }
}
