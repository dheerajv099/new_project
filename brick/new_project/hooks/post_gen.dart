import 'package:mason/mason.dart';
import 'dart:io';

Future<void> run(HookContext context) async {
  final progress = context.logger.progress('Installing packages');

  // Run `flutter pub get` after generation.
  await Process.run('flutter', ['pub', 'get']);

  progress.complete();


}
