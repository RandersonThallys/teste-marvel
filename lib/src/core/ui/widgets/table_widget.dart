import 'package:code_hero/src/core/app_routes.dart';
import 'package:code_hero/src/core/interactor/states/character_state.dart';
import 'package:code_hero/src/core/interactor/stories/character_store.dart';
import 'package:code_hero/src/core/ui/app_theme.dart';
import 'package:code_hero/src/core/ui/widgets/content_table_widget.dart';
import 'package:code_hero/src/core/ui/widgets/pagination_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TableWidget extends StatelessWidget {
  final bool isMobileScreen;
  final CharacterStore store;
  const TableWidget({
    super.key,
    required this.isMobileScreen,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Modular.get<AppTheme>();

    return Observer(builder: (context) {
      return Column(
        children: [
          isMobileScreen
              ? Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 10.0),
                  height: 37.0,
                  color: appTheme.colors.redColor,
                  child: Text(
                    'Personagem',
                    style: appTheme.typography
                        .robotoRegular16px()
                        .copyWith(color: appTheme.colors.whiteColor),
                  ),
                )
              : Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10.0),
                        height: 37.0,
                        color: appTheme.colors.redColor,
                        child: Text(
                          'Personagem',
                          style: appTheme.typography
                              .robotoRegular16px()
                              .copyWith(color: appTheme.colors.whiteColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10.0),
                        height: 37.0,
                        color: appTheme.colors.redColor,
                        child: Text(
                          'Séries',
                          style: appTheme.typography
                              .robotoRegular16px()
                              .copyWith(color: appTheme.colors.whiteColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10.0),
                        height: 37.0,
                        color: appTheme.colors.redColor,
                        child: Text(
                          'Eventos',
                          style:
                              appTheme.typography.robotoRegular16px().copyWith(
                                    color: appTheme.colors.whiteColor,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
          if (store.state is InitListCharacterState) Container(),
          if (store.state is LoadingListCharacterState)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 205),
              child: CircularProgressIndicator(
                color: appTheme.colors.redColor,
              ),
            ),
          if (store.state is SuccessListCharacterState)
            SizedBox(
              height: 448.0,
              child: ListView.builder(
                itemCount: store.state.characters.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ContentTableWidget(
                    onTap: () {
                      Modular.to.pushNamed(AppRoutes().herosDetails,
                          arguments: store.state.characters[index].id);
                    },
                    isMobileScreen: isMobileScreen,
                    character: store.state.characters[index],
                  );
                },
              ),
            ),
          SizedBox(
            height: isMobileScreen ? 18.0 : 50.0,
          ),
          PaginationWidget(
            isMobileScreen: isMobileScreen,
            store: store,
            onPressedNext: () {
              store.nextOffset();
              store.getCharacters();
            },
            onPressedPrevious: () {
              store.previousOffset();
              store.getCharacters();
            },
          ),
          SizedBox(
            height: isMobileScreen ? 24 : 16.0,
          ),
        ],
      );
    });
  }
}
