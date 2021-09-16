import 'package:facebook_feed/shared/components/default_button/default_button.dart';
import 'package:flutter/material.dart';

class TextIconButtonMobile extends StatelessWidget {
  final TextStyle? txtStyle;
  final IconData? icon;
  final String? txt;
  final Color? iconColor;

  TextIconButtonMobile(
      {required this.txtStyle,
      required this.icon,
      required this.txt,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      height: 20,
      color: Colors.transparent,
      r: 0.0,
      align: Alignment.center,
      txtStyle: txtStyle,
      isIcon: true,
      iconSize: 20,
      icon: icon,
      txt: txt,
      iconColor: iconColor,
      width:double.infinity ,
    );
  }
}
