import 'package:code_hero/src/core/interactor/stories/character_store.dart';
import 'package:code_hero/src/core/ui/app_theme.dart';
import 'package:code_hero/src/core/ui/widgets/table_widget.dart';
import 'package:code_hero/src/core/ui/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../core/ui/widgets/title_widget.dart';

class DesktopPage extends StatelessWidget {
  final CharacterStore store;

  const DesktopPage({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Modular.get<AppTheme>();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleWidget(),
                  const SizedBox(
                    height: 34.0,
                  ),
                  TextfieldWidget(
                    controller: store.controller,
                    labelText: 'Nome do personagem',
                    width: 400.0,
                    height: 31.0,
                    onChanged: (value) {
                      Future.delayed(const Duration(milliseconds: 1000), () {
                        store.getCharacters();
                      });
                    },
                  ),
                  const SizedBox(
                    height: 34.0,
                  ),
                  Expanded(
                    child: TableWidget(
                      isMobileScreen: false,
                      store: store,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: appTheme.colors.redColor,
            width: MediaQuery.sizeOf(context).width,
            height: 12.0,
          ),
        ],
      ),
    );
  }
}
