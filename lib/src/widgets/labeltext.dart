import 'package:enablApp/src/localization/app_translation.dart';
import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final double maxFontSize;
  final bool isUpperCase;
  final FontWeight bold;

  LabelText(
      {required this.text,
      required this.color,
      required this.fontSize,
      required this.isUpperCase,
      required this.maxFontSize,
      required this.bold});

  @override
  Widget build(BuildContext context) {
    return (Container(
        child: new Text(
      isUpperCase
          ? AppTranslations.of(context).text(text).toUpperCase()
          : AppTranslations.of(context).text(text),
      style: TextStyle(
        color: color,
        fontWeight: (this.bold == null) ? FontWeight.normal : this.bold,
        fontSize: this.fontSize,
      ),
    )));
  }
}
