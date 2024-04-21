import 'package:code_hero/src/core/interactor/stories/character_store.dart';
import 'package:code_hero/src/core/ui/app_theme.dart';
import 'package:code_hero/src/core/ui/widgets/pagination_widget.dart';
import 'package:code_hero/src/core/ui/widgets/table_widget.dart';
import 'package:code_hero/src/core/ui/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
      body: LayoutBuilder(builder: (context, viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Container(
              // width: 1280.0,
              // height: 720.0,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 42.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'BUSCA MARVEL',
                                      style:
                                          appTheme.typography.robotoBold27px(),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'TESTE FRONT-END',
                                            style: appTheme.typography
                                                .robotoLight27px())
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: appTheme.colors.redColor,
                                    height: 4.0,
                                    width: 54.0,
                                  ),
                                ],
                              ),
                              Text('Factory of Ideia',
                                  style: appTheme.typography.robotoLight27px()),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 34.0,
                        ),
                        TextfieldWidget(
                          controller: store.controller,
                          labelText: 'Nome do personagem',
                          width: 400.0,
                          height: 31.0,
                          onPressed: (value) {
                            store.getCharacters();
                          },
                        ),
                        const SizedBox(
                          height: 34.0,
                        ),
                        TableWidget(
                          isMobileScreen: false,
                          store: store,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: appTheme.colors.redColor,
                    width: MediaQuery.sizeOf(context).width,
                    height: 12.0,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
