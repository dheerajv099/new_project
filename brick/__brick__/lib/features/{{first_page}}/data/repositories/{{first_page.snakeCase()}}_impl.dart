import 'package:dartz/dartz.dart';
import 'package:{{package_name}}/core/error/app_exceptions.dart';
import 'package:{{package_name}}/core/error/app_failures.dart';
import 'package:{{package_name}}/core/usecases/common_usecases.dart';
import 'package:{{package_name}}/features/{{first_page}}/data/data_sources/{{first_page.snakeCase()}}_rds.dart';
import 'package:{{package_name}}/features/{{first_page}}/domain/repositories/{{first_page.snakeCase()}}_repo.dart';
import 'package:{{package_name}}/network/lmg_network_info.dart';

class {{first_page.pascalCase()}}RepoImpl implements {{first_page.pascalCase()}}Repo {
  final NetworkInfo networkInfo;
  final {{first_page.pascalCase()}}RDS {{first_page.camelCase()}}RDS;

  const {{first_page.pascalCase()}}RepoImpl({
    required this.networkInfo,
    required this.{{first_page.camelCase()}}RDS,
  });

  @override
  Future<Either<Failure, String>> {{first_page.camelCase()}}() async {
    if (await networkInfo.isConnected) {
      try {
        final user{{first_page.pascalCase()}} = await {{first_page.camelCase()}}RDS.{{first_page.camelCase()}}User();
        return Right(user{{first_page.pascalCase()}});
      } on ServerException {
        return Left(ServerFailure());
      } catch (e) {
        return Left(CacheFailure(error: e));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

}
