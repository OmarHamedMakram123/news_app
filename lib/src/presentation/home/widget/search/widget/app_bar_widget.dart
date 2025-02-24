import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/app_exports.dart';
import '../../../view_model/search_view_model/search_action.dart';
import '../../../view_model/search_view_model/search_cubit.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var searchViewModel=context.read<SearchCubit>();
    return AppBar(
      automaticallyImplyLeading: false,
      leading: null,
      toolbarHeight: 77.h,
      title: TextFormField(
        controller: searchViewModel.searchController,
        onChanged: (value) => searchViewModel.doAction(GetSearchNewUseCase(q: value)),
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.all(12),

            suffixIcon: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.search,color:Color(0xFF39A552),size: 30,)),
            prefixIcon: IconButton(
                onPressed: () {
                  searchViewModel.searchController.clear();
                },
                icon: Icon(Icons.close,color: Color(0xFF39A552),size: 30,)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.r)
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.r)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.r)
            )
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(77.h);
}
