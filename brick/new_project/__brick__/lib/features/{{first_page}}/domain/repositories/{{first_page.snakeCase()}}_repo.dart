import 'package:dartz/dartz.dart';
import 'package:{{package_name}}/core/error/app_failures.dart';

abstract class {{first_page.pascalCase()}}Repo {
  Future<Either<Failure, String>> {{first_page.camelCase()}}();

}
