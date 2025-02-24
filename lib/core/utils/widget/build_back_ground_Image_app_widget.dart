import '../../app_exports.dart';
import '../../styles/images/app_images.dart';

class BuildBackGroundImageAppWidget extends StatelessWidget {
  final Widget child;
  const BuildBackGroundImageAppWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return    Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.backGround), fit: BoxFit.cover),
          color: Colors.white,
      ),
      child: child,
    );

  }
}
