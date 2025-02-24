import 'package:app_5_news_app/core/extensions/extensions.dart';
import 'package:app_5_news_app/core/network/errors/error_handler.dart';
import 'package:app_5_news_app/core/styles/colors/app_colors.dart';
import 'package:app_5_news_app/core/utils/dialogs/loading_dialog.dart';
import 'package:app_5_news_app/core/utils/widget/empty_screen_widget.dart';
import 'package:app_5_news_app/dependency_injection/di.dart';
import 'package:app_5_news_app/src/presentation/home/view_model/news_view_model/news_cubit.dart';
import 'package:app_5_news_app/src/presentation/home/widget/news/new/news_list_widget.dart';
import 'package:app_5_news_app/src/presentation/home/widget/news/source/source_list_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/app_exports.dart';
import '../../../../../core/utils/widget/error_widget_screen.dart';
import '../../view_model/news_view_model/news_action.dart';
import '../category/item_category_widget.dart';

class NewsBodyWidget extends StatefulWidget {
  final CategoryModel categoryModel;
  const NewsBodyWidget({super.key, required this.categoryModel});

  @override
  State<NewsBodyWidget> createState() => _NewsBodyWidgetState();
}

class _NewsBodyWidgetState extends State<NewsBodyWidget> {
  var newsViewModel = getIt<NewsCubit>();
  @override
  void initState() {
    newsViewModel.doAction(GetSourceAction(widget.categoryModel.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => newsViewModel,
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {
          if (state is GetSourceSuccessState) {
            newsViewModel
                .doAction(GetNewsAction(newsViewModel.sources[0].id ?? ""));
          } else if (state is GetNewsLoadingState) {
            showDialog(
                useSafeArea: false,
                barrierDismissible: false,
                context: context,
                builder: (context) => Center(child: _buildLoadingWidget()));
          } else if (state is GetNewsSuccessState) {
            LoadingDialog.hide(context);
          }
        },
        builder: (context, state) {
          if (state is GetSourceLoadingState) {
            return _buildLoadingWidget();
          } else if (state is GetSourceErrorState) {
            return _buildErrorWidget(ErrorHandler.fromException(
                    state.exception, context.localizations)
                .errorMessage);
          } else if (state is GetNewsErrorState) {
            return _buildErrorWidget(ErrorHandler.fromException(
                    state.exception, context.localizations)
                .errorMessage);
          } else {
            return _buildSuccessWidget(newsViewModel);
          }
        },
      ),
    );
  }

  Widget _buildLoadingWidget() => Center(
          child: CircularProgressIndicator(
        color: AppColors.mainColor,
      ));
  Widget _buildErrorWidget(String errorMessage) => ErrorWidgetScreen(
        width: 200.w,
        errorMessage: errorMessage,
      );
  Widget _buildSuccessWidget(NewsCubit newsCubit) {
    if (newsCubit.sources.isEmpty) {
      return Center(child: CircularProgressIndicator(color: AppColors.mainColor,));
    } else if (newsCubit.news.isEmpty) {
      {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SourceListWidget(),
              verticalSpace(10),
              Expanded(child: EmptyScreenWidget())
            ],
          ),
        );
      }
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SourceListWidget(),
            verticalSpace(10),
            Expanded(child: NewsListWidget())
          ],
        ),
      );
    }
  }
}
