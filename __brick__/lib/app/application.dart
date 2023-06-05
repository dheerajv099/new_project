import 'package:easy_localization/easy_localization.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{package_name}}/core/config/config.dart';
import 'package:{{package_name}}/core/local_db/db_helper.dart';
import 'package:{{package_name}}/core/user/user.dart';
import 'package:{{package_name}}/core/utils/app_theme.dart';
import 'package:{{package_name}}/core/utils/full_scope_bloc_providers.dart';
import 'package:{{package_name}}/core/utils/route_utils.dart';
import 'package:{{package_name}}/core/utils/scroll_behaviour.dart';
import 'package:{{package_name}}/injection_container.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const bool _kTestingCrashlytics = false;

  // static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  // static FirebaseAnalyticsObserver observer =
  //     FirebaseAnalyticsObserver(analytics: analytics);
  //
  // Future<void> _initializeFlutterFire() async {
  //   if (_kTestingCrashlytics) {
  //     /// Force enable crashlytics collection enabled if we're testing it.
  //     await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  //   } else {
  //     /// Else only enable it in non-debug builds.
  //     /// You could additionally extend this to allow users to opt-in.
  //     await FirebaseCrashlytics.instance
  //         .setCrashlyticsCollectionEnabled(!kDebugMode);
  //   }
  // }

  @override
  initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // _initializeFlutterFire();
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
      DbHelper dbHelper = sl();
      UserInfo.setLanguage = dbHelper.box.get(HiveKey.setLanguage);
      UserInfo.setLanguageCountryCode =
          dbHelper.box.get(HiveKey.setLanguageCountryCode);

      if (UserInfo.setLanguage != null) {
        if (mounted) {
          await context.setLocale(
            Locale(
              UserInfo.setLanguage ?? 'en',
              UserInfo.setLanguageCountryCode ?? 'UK',
            ),
          );
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;
    return MultiBlocProvider(
      /// [FullScopedBlocProviders] create all the BLOCs and CUBITs
      providers: FullScopedBlocProviders.providers,
      child: MaterialApp(
        scrollBehavior: MyCustomScrollBehaviour(),
        // navigatorObservers: <NavigatorObserver>[observer],
        title: 'Letmegrab Advert',
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
        darkTheme: AppTheme.darkTheme,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routes: RouteUtils.routes,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.{{first_page.camelCase()}}Page,
        // home: PngHome(),
      ),
    );
  }
}
