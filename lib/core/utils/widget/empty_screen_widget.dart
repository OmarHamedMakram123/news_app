import 'package:app_5_news_app/core/app_exports.dart';

class EmptyScreenWidget extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const EmptyScreenWidget({super.key, this.text="The list is empty! There's nothing to show here. ", this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppImages.cartEmpty, height: 180.h),
            Text(
                textAlign: TextAlign.center,
                text,
                style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: 14.h,
            ),
          ],
        ),
      );

  }
}
