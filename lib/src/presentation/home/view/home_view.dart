import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/routes/page_route_name.dart';
import '../../../../core/app_exports.dart';
import '../../../../core/utils/widget/build_back_ground_Image_app_widget.dart';
import '../../../../dependency_injection/di.dart';
import '../view_model/home_view_model/home_cubit.dart';
import '../widget/category/category_body_widget.dart';
import '../widget/drawer/view/drawer_widget.dart';
import '../widget/news/news_body_widget.dart';

class HomeView extends StatefulWidget {
 const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var homeViewModel = getIt.get<HomeCubit>();
  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => homeViewModel,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return BuildBackGroundImageAppWidget(
            child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  leading: Builder(
                    builder: (BuildContext context) {
                      return IconButton(
                        icon: const Icon(
                            Icons.menu, color: Colors.white, size: 30.0),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      );
                    },
                  ),
                  title: Text(
                    homeViewModel.tileAppBar,
                  ),
                    actions: [
                       homeViewModel.isShowSearchField ? 
                       IconButton(onPressed: () =>_goNextSearchView(),
                           icon:Icon( Icons.search,size: 30,),color: Colors.white)
                           : Text("")
                  ],
                ),
                drawer: Drawer(
                  child: MyDrawerWidget(),

                ),
                body: homeViewModel.categoryModel == null
                    ? CategoryBodyWidget()
                    : NewsBodyWidget(categoryModel: homeViewModel.categoryModel!,)
            ),
          );
        },
      ),
    );
  }
  void _goNextSearchView(){
    Navigator.pushNamed(context, PageRouteName.search,);
  }
}
