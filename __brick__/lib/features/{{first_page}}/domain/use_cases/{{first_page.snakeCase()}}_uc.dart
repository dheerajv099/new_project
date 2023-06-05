

import 'package:dartz/dartz.dart';
import 'package:{{package_name}}/features/{{first_page}}/domain/repositories/{{first_page.snakeCase()}}_repo.dart';
import 'package:{{package_name}}/core/error/app_failures.dart';
import 'package:{{package_name}}/core/usecases/common_usecases.dart';


class {{first_page.pascalCase()}}UC implements UseCase<String,NoParams> {
final {{first_page.pascalCase()}}Repo repo;

  {{first_page.pascalCase()}}UC({required this.repo});

  @override
  Future<Either<Failure, String>> call(NoParams params)  {
    print('{{first_page.pascalCase()}} Usecase $params');
    return repo.{{first_page.camelCase()}}();
  }
}