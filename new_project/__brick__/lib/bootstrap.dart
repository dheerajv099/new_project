import 'dart:async';
import 'dart:developer';
import 'dart:ui';

// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Custom instance of [BlocObserver] which logs
/// any state changes and errors.
class AppBlocObserver extends BlocObserver {
  static const bool logging = false;
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (logging) {
      log('onChange(${bloc.runtimeType}, $change)');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (logging) {
      log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    }
    super.onError(bloc, error, stackTrace);
  }
}

/// Bootstrap is responsible for any common setup and calls
/// [runApp] with the widget returned by [builder] in an error zone.
Future<void> bootstrap(
    {required FutureOr<Widget> Function() builder}) async {
  Bloc.observer = AppBlocObserver();

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    // FirebaseCrashlytics.instance.recordFlutterError(details, fatal: true);
  };

  PlatformDispatcher.instance.onError = (error, stackTrace) {
    log(error.toString(), stackTrace: stackTrace);
    // FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: true);
    return true;
  };

  runApp(await builder());
}
