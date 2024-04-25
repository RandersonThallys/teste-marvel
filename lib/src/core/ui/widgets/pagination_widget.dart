import 'package:code_hero/src/core/interactor/stories/character_store.dart';
import 'package:code_hero/src/core/ui/app_theme.dart';
import 'package:code_hero/src/core/ui/widgets/pagination_number_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PaginationWidget extends StatelessWidget {
  final VoidCallback? onPressedNext;
  final VoidCallback? onPressedPrevious;
  final bool isMobileScreen;
  final CharacterStore store;
  const PaginationWidget(
      {this.onPressedNext,
      this.onPressedPrevious,
      required this.store,
      required this.isMobileScreen,
      super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Modular.get<AppTheme>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: store.index == 0 ? null : onPressedPrevious,
          child: Icon(
            size: isMobileScreen ? 56.0 : 40.0,
            Icons.arrow_left,
            color: store.index == 0
                ? appTheme.colors.redColor.withOpacity(0.5)
                : appTheme.colors.redColor,
          ),
        ),
        SizedBox(
          width: isMobileScreen ? 32.0 : 2.0,
        ),
        SingleChildScrollView(
          child: SizedBox(
            height: 32.0,
            width: isMobileScreen ? 150.0 : 310.0,
            child: Center(
              child: ListView.builder(
                  key: const PageStorageKey<String>('page'),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: (store.state.totalResult / 4).ceil(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        store.pageIndexSelected(index);
                        store.getCharacters();
                      },
                      child: PaginationNumberWidget(
                          index: index, position: store.index),
                    );
                  }),
            ),
          ),
        ),
        SizedBox(
          width: isMobileScreen ? 32.0 : 2.0,
        ),
        GestureDetector(
          onTap: store.index == (store.state.totalResult / 4).ceil() - 1
              ? null
              : onPressedNext,
          child: Icon(
            Icons.arrow_right,
            size: isMobileScreen ? 56.0 : 40.0,
            color: store.index == (store.state.totalResult / 4).ceil() - 1
                ? appTheme.colors.redColor.withOpacity(0.5)
                : appTheme.colors.redColor,
          ),
        ),
      ],
    );
  }
}
