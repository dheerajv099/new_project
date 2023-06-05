import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:{{package_name}}/app/application.dart';
import 'package:{{package_name}}/bootstrap.dart';
import 'package:{{package_name}}/core/config/app_hive_box_keys.dart';
import 'package:{{package_name}}/core/helpers/http_overrides.dart';
import 'package:{{package_name}}/core/local_db/db_helper.dart';
import 'package:{{package_name}}/core/user/user.dart';
import 'package:{{package_name}}/core/utils/app_error_screen.dart';
import 'package:{{package_name}}/injection_container.dart' as di;



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  /// [AppFlutterErrorScreen] is the Custom error widget
  ErrorWidget.builder =
      (FlutterErrorDetails details) => AppFlutterErrorScreen(details: details);

  /// [di] is library prefix of [injection_container.dart]
  await di.setupLocator();
  DbHelper dbHelper = di.sl();
  await dbHelper.initHive();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  UserInfo.setLanguage = dbHelper.box.get(HiveKey.setLanguage);
  UserInfo.setLanguageCountryCode =
      dbHelper.box.get(HiveKey.setLanguageCountryCode);

  HttpOverrides.global = MyHttpOverrides();

  if(!kDebugMode) {
    // await dotenv.load(fileName: 'prod.env');
    await dotenv.load(fileName: 'dev.env');
  } else {
    await dotenv.load(fileName: 'dev.env');
  }

  bootstrap(builder: () => EasyLocalization(
    path: 'assets/locales',

    /// Default locale for the APP is English - United Kingdom
    startLocale: const Locale('en', 'UK'),
    supportedLocales: const <Locale>[
      /// You can find locale JSON files in assets/locales
      Locale('en', 'UK'),
    ],
    child: const HotRestartController(child: MyApp()),
  ),
  );
}

/// [HotRestartController] class for HOT restart application from application
/// It's rebuild [MyApp] widget not re-run main method
class HotRestartController extends StatefulWidget {
  final Widget child;

  const HotRestartController({
    required this.child,
    super.key,
  });

  static performHotRestart(BuildContext context) {
    final _HotRestartControllerState? state =
    context.findAncestorStateOfType<_HotRestartControllerState>();
    state!.performHotRestart();
  }

  @override
  State<HotRestartController> createState() => _HotRestartControllerState();
}

class _HotRestartControllerState extends State<HotRestartController> {
  Key key = UniqueKey();

  void performHotRestart() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: widget.child,
    );
  }
}



