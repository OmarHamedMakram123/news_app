import '../../app_exports.dart';

class LoadingDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
       return  Center(
         child: CircularProgressIndicator());
      },
    );
  }
  static void hide(BuildContext context) {
    if(Navigator.canPop(context)){
      Navigator.pop(context);
    }
  }


}