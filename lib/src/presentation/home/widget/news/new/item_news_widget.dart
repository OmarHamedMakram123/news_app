
import 'package:app_5_news_app/core/utils/widget/cached_network_image%20_widget.dart';
import 'package:app_5_news_app/src/domain/entities/news_entity.dart';

import '../../../../../../config/routes/page_route_name.dart';
import '../../../../../../core/app_exports.dart';

class ItemNewsWidget extends StatelessWidget {
  final NewsEntity newsEntity;
  const ItemNewsWidget({super.key, required this.newsEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: () => _goToNextDetail(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        color: Colors.white,
        elevation: 2,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30.h,horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImageWidget(imageUrl: newsEntity.urlToImage,
              width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
                          verticalSpace(10),
              Text(newsEntity.title,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF79828B))),
              verticalSpace(10),
              Text(
                newsEntity.description,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF42505C)),
              )
            ],
          ),
        ),
      ),
    );
  }


  void _goToNextDetail(BuildContext context) {
    print("omar");
    Navigator.pushNamed(context, PageRouteName.newsDetails,arguments: newsEntity);
  }

}
