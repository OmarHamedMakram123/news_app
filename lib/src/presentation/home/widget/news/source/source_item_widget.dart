import 'package:app_5_news_app/src/domain/entities/source_entity.dart';

import '../../../../../../core/app_exports.dart';

class SourceItemWidget extends StatelessWidget {
 final bool isSelected;
 final SourceEntity sourceEntity;
  const SourceItemWidget({super.key,required this.isSelected, required this.sourceEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.only(
        left :20.w,
        right: 20.w,
        top: 10.h,
        bottom: 10.h,
      ),
      decoration: BoxDecoration(
        color:
        isSelected? Color(0xFF39A552) :
        Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(width: 2 ,
            color: Color(0xFF39A552)
          ,),
      ),
      child: Text(
        sourceEntity.name!,
        style: TextStyle(
            color: isSelected ? Colors.white :
            Color(0xFF39A552),
            fontSize: 14.sp
        ),
      ),
    );  }
}

