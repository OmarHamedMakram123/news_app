import 'package:app_5_news_app/core/utils/widget/build_back_ground_Image_app_widget.dart';
import 'package:app_5_news_app/src/presentation/news_details/widget/news_details_body_widget.dart';
import '../../../../core/app_exports.dart';

class NewsDetailsView extends StatelessWidget {
  const NewsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildBackGroundImageAppWidget(
        child: Scaffold(
      appBar: AppBar(
        title: Text("News Details"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20.0),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: SingleChildScrollView(child: NewsDetailsBodyWidget()),
    ));
  }
}
