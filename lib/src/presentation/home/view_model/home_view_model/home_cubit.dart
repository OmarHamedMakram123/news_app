import 'package:app_5_news_app/src/presentation/home/widget/category/item_category_widget.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/app_exports.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {

  HomeCubit() : super(HomeInitial());


  CategoryModel ? categoryModel;
  String tileAppBar = "news_app";
  bool isShowSearchField=false;
  void changeCategoryMode({CategoryModel ? category,required bool isSearchField}){
    categoryModel= category;
    tileAppBar=category==null  ? "News App " : category.text;
    isShowSearchField=isSearchField;
    emit(UpdateCategoryModelState());
  }

}
