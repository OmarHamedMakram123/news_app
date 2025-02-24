import 'package:app_5_news_app/src/presentation/home/view_model/home_view_model/home_cubit.dart';
import 'package:app_5_news_app/src/presentation/home/widget/drawer/widget/item_my_drawer_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/app_exports.dart';

class DrawerBodyWidget extends StatelessWidget {
  const DrawerBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var homeViewModel  =context.read<HomeCubit>();
    return Container(
      width: 300.h,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [  BoxShadow(  color: Colors.grey.withOpacity(0.5),  spreadRadius: 5,  blurRadius: 7,  offset: Offset(0, 3),  )],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 64 ),
            color:  Color(0xFF39A552),
            child: Text('News App',style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24
            ),),
          ),
          ItemMyDrawerWidget(
            title: "Category",
            icon: Icons.list,
            onTap: (){
              homeViewModel.changeCategoryMode(category:  null,isSearchField: false);
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 20,),
          ItemMyDrawerWidget(
            title: "Settings",
            icon: Icons.settings,
            onTap: (){
              Navigator.pop(context);
            },
          ),        ],
      ),
    );
  }
}
