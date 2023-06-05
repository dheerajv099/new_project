part of '{{first_page}}_cubit.dart';

abstract class {{first_page.pascalCase()}}State extends Equatable {
  const {{first_page.pascalCase()}}State();

  @override
  List<Object> get props => [];
}

class {{first_page.pascalCase()}}Initial extends {{first_page.pascalCase()}}State {
  @override
  List<Object> get props => [];
}


// state with values
class {{first_page.pascalCase()}}SuccessState extends {{first_page.pascalCase()}}State {
  final String message;
  const {{first_page.pascalCase()}}SuccessState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class {{first_page.pascalCase()}}FailureState extends {{first_page.pascalCase()}}State {
  final String message;
  const {{first_page.pascalCase()}}FailureState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

