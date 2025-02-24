import 'package:app_5_news_app/src/presentation/home/view_model/search_view_model/search_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/app_exports.dart';
import '../../news/new/item_news_widget.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var newViewModel=context.read<SearchCubit>();
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: newViewModel.news.length,
      separatorBuilder: (context, index) => verticalSpace(10),
      itemBuilder: (context, index) {
        return ItemNewsWidget(newsEntity: newViewModel.news[index],);
      },);
  }
}
