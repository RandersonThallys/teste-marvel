import 'package:code_hero/src/core/ui/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/');
    return MaterialApp.router(
      title: 'Busca Marvel',
      theme: AppTheme().lightTheme,
      routerConfig: Modular.routerConfig,
    );
  }
}
