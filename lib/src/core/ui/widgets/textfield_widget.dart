import 'package:code_hero/src/core/ui/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TextfieldWidget extends StatelessWidget {
  final String labelText;
  final double? height;
  final double? width;
  final TextEditingController? controller;
  final ValueChanged? onChanged;
  final Function(String)? onPressed;
  const TextfieldWidget({
    super.key,
    required this.labelText,
    this.height,
    this.width,
    this.controller,
    this.onPressed,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Modular.get<AppTheme>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: appTheme.typography.robotoRegular16px(),
        ),
        SizedBox(
          height: height,
          width: width,
          child: TextFormField(
            controller: controller,
            onChanged: onChanged,
            onFieldSubmitted: onPressed,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: appTheme.colors.greyLightColor,
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: appTheme.colors.greyLightColor,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: appTheme.colors.greyLightColor,
                    width: 1.0,
                  ),
                ),
                contentPadding: const EdgeInsets.only(
                    bottom: 10.0, left: 10.0, right: 10.0)),
          ),
        ),
      ],
    );
  }
}
