import 'package:code_hero/src/core/app_routes.dart';
import 'package:code_hero/src/core/ui/app_theme.dart';
import 'package:code_hero/src/modules/character/data/entities/character_details_entity.dart';
import 'package:code_hero/src/modules/character/interactor/character_details_store.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DesktopPage extends StatelessWidget {
  final CharacterDetailsEntity character;
  const DesktopPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final appTheme = Modular.get<AppTheme>();
    return Scaffold(
      body: Observer(builder: (context) {
        return LayoutBuilder(builder: (context, viewportConstraints) {
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
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Modular.to.navigate(AppRoutes().home);
                                      },
                                      icon: Icon(
                                        Icons.arrow_back_ios_new,
                                        color: appTheme.colors.redColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 16.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text: 'BUSCA MARVEL',
                                            style: appTheme.typography
                                                .robotoBold27px(),
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
                                  ],
                                ),
                                Text('Factory of Idea',
                                    style:
                                        appTheme.typography.robotoLight27px()),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 62.0,
                          ),
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100.0),
                                child: Image.network(
                                  height: 58.0,
                                  width: 58.0,
                                  '${character.thumbnail.path}.${character.thumbnail.extension}',
                                  alignment: Alignment.topLeft,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const SizedBox(
                                width: 25.0,
                              ),
                              Text(
                                character.name,
                                style: appTheme.typography
                                    .robotoRegular21px()
                                    .copyWith(color: appTheme.colors.greyColor),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 24.0,
                          ),
                          Text(
                            character.description.isEmpty
                                ? 'Sem descrição'
                                : character.description,
                            style: appTheme.typography
                                .robotoRegular21px()
                                .copyWith(color: appTheme.colors.greyColor),
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
        });
      }),
    );
  }
}
