import 'package:{{package_name}}/features/{{first_page.snakeCase()}}/presentation/manager/{{first_page.snakeCase()}}/{{first_page.snakeCase()}}_cubit.dart';
import 'package:{{package_name}}/features/{{first_page.snakeCase()}}/domain/use_cases/{{first_page.snakeCase()}}_uc.dart';
import 'package:{{package_name}}/features/{{first_page.snakeCase()}}/domain/repositories/{{first_page.snakeCase()}}_repo.dart';
import 'package:{{package_name}}/features/{{first_page.snakeCase()}}/data/repositories/{{first_page.snakeCase()}}_impl.dart';
import 'package:{{package_name}}/features/{{first_page.snakeCase()}}/data/data_sources/{{first_page.snakeCase()}}_rds.dart';
import 'package:{{package_name}}/features/{{first_page.snakeCase()}}/data/repositories/{{first_page.snakeCase()}}_impl.dart';
import 'package:{{package_name}}/core/model/user.dart';

import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:{{package_name}}/core/local_db/db_helper.dart';
import 'package:{{package_name}}/network/lmg_network_info.dart';
import 'package:{{package_name}}/core/user/user.dart';
import 'package:{{package_name}}/core/api/api_services.dart';




final sl = GetIt.instance;

Future<void> setupLocator() async{
  sl.registerFactory(() => {{first_page.pascalCase()}}Cubit( {{first_page.camelCase()}}UC: sl()));

/// ----- UseCases -----
  sl.registerLazySingleton(() => {{first_page.pascalCase()}}UC(repo: sl()));

/// ----- Repository -----
  sl.registerLazySingleton<{{first_page.pascalCase()}}Repo>(() => {{first_page.pascalCase()}}RepoImpl({{first_page.camelCase()}}RDS: sl(), networkInfo: sl()));


/// ----- Data Sources -----
  sl.registerLazySingleton<{{first_page.pascalCase()}}RDS>(() => {{first_page.pascalCase()}}RDSImpl( apiServices: sl()));

///core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton<User>(() => User());
  sl.registerLazySingleton<DbHelper>(() => DbHelper());
  sl.registerLazySingleton<UserInfo>(() => UserInfo());
  sl.registerLazySingleton(() => ApiServices(dio: Dio()));


/// ----- Utils -----


}