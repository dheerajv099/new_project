import 'package:flutter/material.dart';

class {{first_page.pascalCase()}}Page extends StatelessWidget {
  const {{first_page.pascalCase()}}Page ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
                  body: SafeArea(
                  child: Center(child: Text('{{first_page}} page'),),
                ),
              );
  }
}

