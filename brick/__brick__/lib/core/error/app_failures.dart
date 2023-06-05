import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:{{package_name}}/core/config/app_failure_messages.dart';

abstract class Failure extends Equatable {
  final dynamic error;

  Failure({this.error}) {
    // TODO(ahad): find way to ignore this line in auth_repo_impl_test
    /// to print stack trace if any error occurs
    // _printStackTrace();  // coverage:ignore-line
  }

  void _printStackTrace() {
    if (kDebugMode) {
      debugPrint(error?.stackTrace.toString() ?? ''); // coverage:ignore-line
    }
  }

  String get message;

  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {
  @override
  String get message => AppFailureMessage.serverFail;
}

class CacheFailure extends Failure {
  CacheFailure({super.error});

  @override
  String get message {
    if (error == null) {
      return AppFailureMessage.cacheFail;
    }
    return '$error';
  }
}

class NetworkFailure extends Failure {
  @override
  String get message => AppFailureMessage.networkFailure;
}
