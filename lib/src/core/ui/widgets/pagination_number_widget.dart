import 'package:code_hero/src/core/ui/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PaginationNumberWidget extends StatelessWidget {
  final int index;
  final int position;
  const PaginationNumberWidget({
    super.key,
    required this.index,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Modular.get<AppTheme>();

    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          alignment: Alignment.center,
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: index != position
                ? appTheme.colors.whiteColor
                : appTheme.colors.redColor,
            borderRadius: BorderRadius.circular(100),
            border: index != position
                ? Border.all(color: appTheme.colors.redColor)
                : null,
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: FittedBox(
              child: Text(
                '${index + 1}',
                style: appTheme.typography.robotoRegular21px().copyWith(
                      color: index != position
                          ? appTheme.colors.redColor
                          : appTheme.colors.whiteColor,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
