import 'package:app_5_news_app/core/app_exports.dart';
import 'package:lottie/lottie.dart';
import '../../styles/colors/app_colors.dart';
class ErrorWidgetScreen extends StatelessWidget {
  final String errorMessage;
   final double   width;
   final String image;
   final  void Function()? onPressed;
  const ErrorWidgetScreen({super.key, required this.errorMessage, required this.width,this.image=AppImages.error, this.onPressed });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width:width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset(image),
            Text(errorMessage,textAlign: TextAlign.center,style: AppFonts.font17,),
            verticalSpace(40),
            IconButton(
              onPressed: onPressed,
                icon:   Icon(Icons.refresh,size: 100,color: AppColors.mainColor,))
          ],
        ),
      ),
    );
  }
}
