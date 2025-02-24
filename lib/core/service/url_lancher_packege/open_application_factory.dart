import 'open_application.dart';


enum Application{
  chrome,
}

class ClickApplicationFactory{
  static  OpenApplication getClickApplication({required Application application }){
    switch (application) {
      case Application.chrome:
        return OpenChromeApp();
    }
  }
}