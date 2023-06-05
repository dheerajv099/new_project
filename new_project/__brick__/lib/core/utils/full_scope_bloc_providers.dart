import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:{{package_name}}/features/{{first_page}}/presentation/manager/{{first_page.snakeCase()}}/{{first_page.snakeCase()}}_cubit.dart';
import 'package:{{package_name}}/injection_container.dart';
import 'package:provider/single_child_widget.dart';

class FullScopedBlocProviders {
  static List<SingleChildWidget> providers = [
    BlocProvider(
      create: (context) => sl<{{first_page.pascalCase()}}Cubit>(),
    ),
  ];
}
