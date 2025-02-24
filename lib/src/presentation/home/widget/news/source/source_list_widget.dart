import 'package:app_5_news_app/src/presentation/home/view_model/news_view_model/news_cubit.dart';
import 'package:app_5_news_app/src/presentation/home/widget/news/source/source_item_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/app_exports.dart';

class SourceListWidget extends StatefulWidget {
  const SourceListWidget({super.key});

  @override
  State<SourceListWidget> createState() => _SourceListWidgetState();
}

class _SourceListWidgetState extends State<SourceListWidget> {
  @override
  Widget build(BuildContext context) {
    var sourceViewModel = context.read<NewsCubit>();
    return SizedBox(
      height: 55.h,
      child: DefaultTabController(
        initialIndex: 0,
        length: sourceViewModel.sources.length,
        child: TabBar(
          dividerHeight: 0,
          indicatorColor: Colors.white,
          indicator: BoxDecoration(
            color: Colors.transparent,
          ),
          padding: EdgeInsets.zero,
          indicatorPadding: EdgeInsets.zero,
          tabAlignment: TabAlignment.start,
          onTap: (index) {
    sourceViewModel.onTabSource(index: index);
     setState(() {});
    },
            isScrollable: true,
          tabs: sourceViewModel.sources.map((e) {
            return SourceItemWidget(
              isSelected: sourceViewModel.sources.indexOf(e) ==
                  sourceViewModel.selectedIndexTab,
              sourceEntity: e,
            );
          }).toList(),
        ),
      ),
    );
  }
}
