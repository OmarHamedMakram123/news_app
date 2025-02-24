import 'package:app_5_news_app/config/routes/page_route_name.dart';
import 'package:app_5_news_app/core/styles/images/app_images.dart';
import 'package:app_5_news_app/core/utils/functions/spaceing/spaceing.dart';
import 'package:app_5_news_app/src/presentation/home/view_model/home_view_model/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/app_exports.dart';

class ItemCategoryWidget extends StatelessWidget {
  final CategoryModel categoryModel;
  const ItemCategoryWidget({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    var homeViewModel  =context.read<HomeCubit>();
    return GestureDetector(
     onTap: () {
         homeViewModel.changeCategoryMode(category: categoryModel, isSearchField: true);

       },
      child: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: categoryModel .backGround,
            borderRadius: BorderRadius.only(
                topLeft:const  Radius.circular(20),
                topRight:const Radius.circular(20),
                bottomRight: categoryModel.index % 2 == 0 ?const Radius.circular(0):const Radius.circular(20),
                bottomLeft: categoryModel.index % 2 == 0 ?const Radius.circular(20):const Radius.circular(0)

            )
        ),
        child: Column(
          children: [
            Image.asset(categoryModel.image,
              width: 127.w,
              height: 127.h,
            ),
            verticalSpace(10),
            Text(categoryModel.text,style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w400,color: Color(0xFFFFFFFF)),)
          ],
        ),
      ),
    );
  }
  void _goNextNewsPage(BuildContext context,) {
    Navigator.pushNamed(context, PageRouteName.news,arguments: categoryModel);
  }
}

class CategoryModel {
  final String id;
  final String text;
  final String image;
  final Color backGround;
  final int index;

  CategoryModel({
    required this.id,
    required this.text,
    required this.image,
    required this.backGround,
    required this.index
  });


  static List<CategoryModel> categoryList=[
      CategoryModel(
          id:  'sports',
          text: 'Sports',
          backGround:  Color(0xFFC91C22),
          image: AppImages.sports,
          index: 0
      ),
      CategoryModel(
          id:  'entertainment',
          text: 'Entertainment',
          backGround:  Color(0xFF4F5A69),
          image: AppImages.environment,index: 1
      ),
      CategoryModel(
          id:  'business',
          text: 'Business',
          backGround:  Color(0xFFCF7E48),
          image: AppImages.business,index: 2
      ),
      CategoryModel(
          id:  'health',
          text: 'Health',
          backGround:  Color(0xFFED1E79),
          image: AppImages.health,index: 4
      ),
      CategoryModel(
          id:  'science',
          text: 'Science',
          backGround:  Color(0xFFF2D352),
          image: AppImages.science,index: 5
      ),

   ];


}
