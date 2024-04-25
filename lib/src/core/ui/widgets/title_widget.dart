import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../app_theme.dart';

class TitleWidget extends StatelessWidget {
  final bool isMobileScreen;

  TitleWidget({super.key, this.isMobileScreen = false});

  final appTheme = Modular.get<AppTheme>();

  Widget _title(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          child: RichText(
            text: TextSpan(
              text: 'BUSCA MARVEL',
              style: appTheme.typography.robotoBold27px(),
              children: <TextSpan>[
                TextSpan(
                    text: 'TESTE FRONT-END',
                    style: appTheme.typography.robotoLight27px())
              ],
            ),
          ),
        ),
        Container(
          color: appTheme.colors.redColor,
          height: 4.0,
          width: 54.0,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isMobileScreen
          ? const EdgeInsets.fromLTRB(
              42.0,
              12.0,
              42.0,
              0.0,
            )
          : const EdgeInsets.only(top: 20.0),
      child: isMobileScreen ? _title() : Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _title(),
          Text('Factory of Ideia',
              style: appTheme.typography.robotoLight27px()),
        ],
      ),
    );
  }
}
