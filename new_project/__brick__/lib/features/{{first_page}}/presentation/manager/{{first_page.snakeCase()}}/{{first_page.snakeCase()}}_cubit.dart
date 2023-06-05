import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:{{package_name}}/features/{{first_page}}/domain/use_cases/{{first_page.snakeCase()}}_uc.dart';

part '{{first_page}}_state.dart';

class {{first_page.pascalCase()}}Cubit extends Cubit<{{first_page.pascalCase()}}State> {
 {{first_page.pascalCase()}}Cubit({
    required this.{{first_page.camelCase()}}UC,
  }) : super({{first_page.pascalCase()}}Initial());

  final {{first_page.pascalCase()}}UC {{first_page.camelCase()}}UC;

}
