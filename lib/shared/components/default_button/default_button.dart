import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
   Color? color;
   double? r;
   double? width;
   double? height;
   bool? isBorder;
   String? txt;
   bool? isIcon;
   IconData? icon;
   Alignment? align;
   Color? iconColor;
   TextStyle? txtStyle;
   double? iconSize;
   Function? onPress;
  DefaultButton(
      {
        this.onPress,
      this.color,
      this.txtStyle,
      this.iconSize=0.0,
      this.align =Alignment.center,
      this.r=0.0,
      this.icon,
      this.isIcon= false,
      this.txt ='',
      this.width,
      this.height,
      this.isBorder = false,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
        icon: isIcon!
            ? Icon(
                icon,
                color: iconColor,
                size: iconSize,
              )
            : Container(),
        onPressed:()=>onPress,
        style: ElevatedButton.styleFrom(
            alignment: align,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(r!),
            ),
fixedSize: Size(width!,height!) ,
            primary:color ,
            side: BorderSide(
                color: Colors.black54,
                style: isBorder! ? BorderStyle.solid : BorderStyle.none,
                width: isBorder! ? 1 : 0)),
        label: Text(
                txt!,
                style: txtStyle,
              ));
  }
}
