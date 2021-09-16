import 'package:facebook_feed/models/posts_model.dart';
import 'package:facebook_feed/shared/style/font_style.dart';
import 'package:flutter/material.dart';

class DefaultSheetButton extends StatelessWidget {
 final ListSheet listSheet;
 final TextStyle titleStyle;
 final TextStyle subTitleStyle;
 final Color color;
 final double size;
 final String? title;
 final String? subtitle;
 final IconData? leadingIcon;
 DefaultSheetButton(
      {required this.listSheet,
        required this.titleStyle,
        required this.subTitleStyle,
        required this.color,
      required this.size,
        required this.title,
        required this.leadingIcon,
      required this.subtitle});


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title!,
        style: black22regular(),
      ),
      subtitle: Text(
        subtitle!,
        style: black20regular(),
      ),
      leading: Icon(
        leadingIcon,
        color: Colors.black,
        size: 30,
      ),
    );
  }


}







