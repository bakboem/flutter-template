import 'package:template/common/function/common_function.dart';
import 'package:template/globalProviders/app_theme_provider.dart';
import 'package:template/globalProviders/language_provider.dart';
import 'package:template/globalProviders/next_page_loading_provider.dart';
import 'package:template/router.dart';
import 'package:template/services/key_service.dart';
import 'package:template/views/auth/auth_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LiveApp extends StatefulWidget {
  const LiveApp({super.key});
  @override
  LiveAppState createState() => LiveAppState();
}

class LiveAppState extends State<LiveApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AppThemeProvider>(
            create: (context) => AppThemeProvider(),
          ),
          ChangeNotifierProvider<LanguageProvider>(
            create: (context) => LanguageProvider(),
          ),
          ChangeNotifierProvider<NextPageLoadingProvider>(
            create: (_) => NextPageLoadingProvider(),
          ),
        ],
        builder: (context, _) {
          final p = context.read<LanguageProvider>();
          p.init();
          return ScreenUtilInit(
            designSize: const Size(360, 760),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, _) {
              return MaterialApp(
                  //FirebaseAnalytics 연동.
                  builder: FToastBuilder(),
                  navigatorObservers: [BluetoothAdapterStateObserver()],
                  navigatorKey: KeyService.baseAppKey,
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: EasyLocalization.of(context)?.locale,
                  debugShowCheckedModeBanner: false,
                  theme: context.read<AppThemeProvider>().themeData,
                  home: const AuthPage(),
                  routes: routes);
            },
          );
        });
  }
}

class BluetoothAdapterStateObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) async {
    super.didPush(route, previousRoute);
    final ctx = KeyService.baseAppKey.currentContext;
    if (ctx != null) {
      pr('do route $route ');
    }
  }
}
