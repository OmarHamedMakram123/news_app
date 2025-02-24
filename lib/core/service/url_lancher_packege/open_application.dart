import 'package:url_launcher/url_launcher.dart';

abstract class OpenApplication {
  Future<bool>openClickApplication({required String link});
}



class OpenChromeApp extends OpenApplication{
  @override
  Future<bool> openClickApplication({required String link}) async{
    if(await canLaunchUrl(Uri.parse(link))){
      return await launchUrl(Uri.parse(link),mode: LaunchMode.externalApplication);
    }else{
      return false;
    }
  }

}

