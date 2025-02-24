import '../../../../../core/app_exports.dart';
import 'item_category_widget.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return      DynamicHeightGridView(
        mainAxisSpacing: 25.w,
        crossAxisSpacing: 20.h,
        builder: (context, index) => ItemCategoryWidget(
          categoryModel: CategoryModel(
              text:  CategoryModel.categoryList[index]. text,
              image: CategoryModel.categoryList[index].image,
              backGround:  CategoryModel.categoryList[index].backGround,
              id: CategoryModel.categoryList[index].id,
              index: index
          ),
        ),
        itemCount: CategoryModel.categoryList.length,
        crossAxisCount: 2);
  }
}
