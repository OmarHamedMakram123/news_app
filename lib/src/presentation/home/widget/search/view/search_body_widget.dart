import 'package:app_5_news_app/dependency_injection/di.dart';
import 'package:app_5_news_app/src/presentation/home/view_model/search_view_model/search_cubit.dart';
import 'package:app_5_news_app/src/presentation/home/widget/search/widget/result_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/app_exports.dart';
import '../../../../../../core/utils/widget/build_back_ground_Image_app_widget.dart';
import '../../../view_model/search_view_model/search_action.dart';
import '../widget/app_bar_widget.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  var searchCubit = getIt.get<SearchCubit>();
  @override
  void initState() {
    searchCubit.doAction(GetSearchNewUseCase(q: 'sports'));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => searchCubit,
      child: BuildBackGroundImageAppWidget(
        child: Scaffold(
          appBar: AppBarWidget(),
          body: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is GetNewsSearchLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is GetNewsSearchErrorState) {
                return Center(
                  child: Text(state.exception.toString()),
                );
              }
              if (state is GetNewsSearchSuccessState) {
                if(searchCubit.news.isEmpty){
                  return const Center(
                    child: Text('No Data',style: TextStyle(fontSize: 30,color: Colors.green),),
                  );

                }else {
                  return ResultWidget();
                }
                }

              return ResultWidget();
            },
          ),
        ),
      ),
    );
  }
}
