import 'package:code_hero/src/core/interactor/entities/character_entity.dart';
import 'package:code_hero/src/core/ui/app_theme.dart';
import 'package:code_hero/src/modules/home/interactor/stories/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentTableWidget extends StatefulWidget {
  final CharacterEntity character;
  final bool isMobileScreen;
  final VoidCallback onTap;
  const ContentTableWidget({
    super.key,
    required this.isMobileScreen,
    required this.character,
    required this.onTap,
  });

  @override
  State<ContentTableWidget> createState() => _ContentTableWidgetState();
}

class _ContentTableWidgetState extends State<ContentTableWidget> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final appTheme = Modular.get<AppTheme>();
    return Observer(builder: (context) {
      return InkWell(
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        onTap: widget.onTap,
        child: Container(
          color: isHover
              ? appTheme.colors.redColor.withOpacity(0.1)
              : appTheme.colors.whiteColor,
          height: widget.isMobileScreen ? null : 112.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              widget.isMobileScreen
                  ? Container(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: Image.network(
                              height: 58.0,
                              width: 58.0,
                              '${widget.character.thumbnail.path}.${widget.character.thumbnail.extension}',
                              alignment: Alignment.topLeft,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            width: 25.0,
                          ),
                          Text(
                            widget.character.name,
                            style: appTheme.typography
                                .robotoRegular21px()
                                .copyWith(color: appTheme.colors.greyColor),
                          ),
                        ],
                      ),
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20.0,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 16.0,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100.0),
                                child: Image.network(
                                  height: 58.0,
                                  width: 58.0,
                                  '${widget.character.thumbnail.path}.${widget.character.thumbnail.extension}',
                                  alignment: Alignment.topLeft,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const SizedBox(
                                width: 25.0,
                              ),
                              Flexible(
                                child: Text(
                                  widget.character.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: appTheme.typography
                                      .robotoRegular21px()
                                      .copyWith(
                                          color: appTheme.colors.greyColor,
                                          height: 1.1),
                                ),
                              )
                            ],
                          ),
                        )),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                            child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (var serie in widget.character.series
                                    .sublist(
                                        0,
                                        widget.character.series.length > 3
                                            ? 3
                                            : null))
                                  Text(
                                    serie.name,
                                    overflow: TextOverflow.ellipsis,
                                    style: appTheme.typography
                                        .robotoRegular21px()
                                        .copyWith(
                                          color: appTheme.colors.greyColor,
                                          height: 1.1,
                                        ),
                                  ),
                              ],
                            ),
                          ),
                        )),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (var event in widget.character.events
                                    .sublist(
                                        0,
                                        widget.character.events.length > 3
                                            ? 3
                                            : null))
                                  Text(
                                    event.name,
                                    style: appTheme.typography
                                        .robotoRegular21px()
                                        .copyWith(
                                            color: appTheme.colors.greyColor,
                                            height: 1.1),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
              Divider(
                thickness: 2.0,
                color: appTheme.colors.redColor.withOpacity(0.35),
                height: 1.0,
              ),
            ],
          ),
        ),
      );
    });
  }
}
