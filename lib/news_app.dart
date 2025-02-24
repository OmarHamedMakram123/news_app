import 'config/localization/l10n.dart';
import 'config/routes/app_routes.dart';
import 'config/routes/page_route_name.dart';
import 'config/theme/app_theme.dart';
import 'core/app_exports.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:Size(413, 870) ,
      builder: (context, child) {
        return MaterialApp(
          title: 'News App',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: L10n.all,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes.onGenerateRoute,
          initialRoute: PageRouteName.home,
          theme: AppTheme.lightTheme,
          themeMode: ThemeMode.light,
        );
      },
    );

  }
}
