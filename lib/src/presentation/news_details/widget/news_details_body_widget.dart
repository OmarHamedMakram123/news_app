import 'package:app_5_news_app/core/utils/widget/cached_network_image%20_widget.dart';
import 'package:app_5_news_app/src/domain/entities/news_entity.dart';

import '../../../../core/app_exports.dart';
import '../../../../core/service/url_lancher_packege/open_application_factory.dart';

class NewsDetailsBodyWidget extends StatelessWidget {
  const NewsDetailsBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var newsDetails = ModalRoute.of(context)!.settings.arguments as NewsEntity;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImageWidget(
              imageUrl: newsDetails.urlToImage,
              width: double.infinity,
              height: 230.h,
              fit: BoxFit.cover,
            ),
            verticalSpace(8),
            Text(newsDetails.sourceName, style: AppFonts.font14KGray),
            verticalSpace(8),
            Text(
              newsDetails.title,
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
            ),
            verticalSpace(16),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "30 February 2025 | 4 min read ",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Color(0xFF79828B),
                ),
              ),
            ),
            verticalSpace(16),
            Text(
             newsDetails.content,
              style: TextStyle(fontSize: 16.sp, color: Color(0xFF42505C)),
            ),
            verticalSpace(35),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton.icon(
                  onPressed: () =>ClickApplicationFactory.getClickApplication(application: Application.chrome).openClickApplication(link: newsDetails.url),
                  label: Text('View Full Article'),
                  icon: Icon(Icons.arrow_back_ios,
                      size: 20, color: Color(0xFF42505C))),
            ),
            verticalSpace(35),
          ],
        ));
  }
}
