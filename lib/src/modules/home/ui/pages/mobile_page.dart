import 'package:code_hero/src/core/interactor/stories/character_store.dart';
import 'package:code_hero/src/core/ui/app_theme.dart';
import 'package:code_hero/src/core/ui/widgets/table_widget.dart';
import 'package:code_hero/src/core/ui/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MobilePage extends StatelessWidget {
  final CharacterStore store;
  const MobilePage({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Modular.get<AppTheme>();

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, viewportConstraints) {
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            42.0,
                            12.0,
                            42.0,
                            0.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'BUSCA MARVEL',
                                  style: appTheme.typography.robotoBold16px(),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'TESTE FRONT-END',
                                        style: appTheme.typography
                                            .robotoLight16px())
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
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 42.0),
                          child: TextfieldWidget(
                            controller: store.controller,
                            labelText: 'Nome do personagem',
                            width: 400.0,
                            height: 31.0,
                            onPressed: (value) {
                              store.getCharacters();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        TableWidget(
                          isMobileScreen: true,
                          store: store,
                        ),
                      ],
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
      ),
    );
  }
}
