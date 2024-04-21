import 'package:code_hero/src/core/app_routes.dart';
import 'package:code_hero/src/core/ui/app_theme.dart';
import 'package:code_hero/src/modules/character/data/entities/character_details_entity.dart';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MobilePage extends StatelessWidget {
  final CharacterDetailsEntity character;
  const MobilePage({
    super.key,
    required this.character,
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
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: 'BUSCA MARVEL',
                                          style: appTheme.typography
                                              .robotoBold16px(),
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
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 36.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 42.0),
                          child: Row(
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
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 42.0),
                          child: Text(
                            textAlign: TextAlign.justify,
                            character.description.isEmpty
                                ? 'Sem descrição'
                                : character.description,
                            style: appTheme.typography
                                .robotoRegular21px()
                                .copyWith(color: appTheme.colors.greyColor),
                          ),
                        ),
                        const SizedBox(
                          height: 32.0,
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
