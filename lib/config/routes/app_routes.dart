import 'package:app_5_news_app/config/routes/page_route_name.dart';
import '../../core/app_exports.dart';
import '../../src/presentation/home/view/home_view.dart';
import '../../src/presentation/home/widget/search/view/search_body_widget.dart';
import '../../src/presentation/news_details/view/news_details_view.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.home:
        return _handleMaterialPageRoute(widget: HomeView(), settings: settings);
      case PageRouteName.search:
        return _handleMaterialPageRoute(widget: SearchView(), settings: settings);
      case PageRouteName.newsDetails:
        return _handleMaterialPageRoute(widget: NewsDetailsView(), settings: settings);
      default:
        return _handleMaterialPageRoute(widget: HomeView(), settings: settings);
    }
  }

  static MaterialPageRoute<dynamic> _handleMaterialPageRoute(
      {required Widget widget, required RouteSettings settings}) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => widget,
    );
  }
}
