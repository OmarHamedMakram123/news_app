import 'package:app_5_news_app/config/routes/page_route_name.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/app_exports.dart';
import '../../../view_model/news_view_model/news_cubit.dart';
import 'item_news_widget.dart';

class NewsListWidget extends StatelessWidget {
  const NewsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var newViewModel =context.read<NewsCubit>();
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: newViewModel.news.length,
      separatorBuilder: (context, index) => verticalSpace(10),
      itemBuilder: (context, index) {
      return ItemNewsWidget(newsEntity: newViewModel.news[index],);
    },);
  }

}
