import 'package:app_5_news_app/core/utils/functions/spaceing/spaceing.dart';
import 'package:app_5_news_app/src/presentation/home/widget/category/category_list_widget.dart';

import '../../../../../core/app_exports.dart';
class CategoryBodyWidget extends StatelessWidget {
  const CategoryBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.0.w,vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pick your category \n of interest",
            style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xFF4F5A69)
            ),
          ),
          verticalSpace(33),
          Expanded(child: CategoryListWidget()),
        ],
      ),
    );
  }
}
