import 'package:app_5_news_app/core/app_exports.dart';
import 'package:app_5_news_app/core/network/common/result.dart';
import 'package:app_5_news_app/src/domain/entities/news_entity.dart';
import 'package:app_5_news_app/src/presentation/home/view_model/search_view_model/search_action.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../domain/use_cas/get_search_use_case.dart';

part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  final GetSearchUseCase getSearchUseCase;
  SearchCubit(this.getSearchUseCase) : super(SearchInitial());

  void doAction(SearchAction searchAction) async{
     switch (searchAction) {
       case GetSearchNewUseCase(): return await _getSearchNews(q: searchAction.q);
     }
  }


  List<NewsEntity>news=[];
  TextEditingController searchController=TextEditingController();
  Future<void>_getSearchNews({required String q})async{
    if(q == '' || q.isEmpty){
      return;
    }
    emit(GetNewsSearchLoadingState());
    var result=await getSearchUseCase.searchNews(q: q);
    switch (result) {
      case Success<List<NewsEntity>>():
        news=result.data;
        emit(GetNewsSearchSuccessState());
      case Error<List<NewsEntity>>():
        emit(GetNewsSearchErrorState(result.exception));
    }
  }
}
