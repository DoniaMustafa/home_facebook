import 'package:flutter/material.dart';

class DefaultCircleButtonIcon extends StatelessWidget {
  final double? r;
  final IconData? icon;
  final Color? iconColor;
  final double? size;
  final Color? circleColor;
  final Function? onPress;
  DefaultCircleButtonIcon(
      {this.r =0.0,
        this.onPress,
        this.icon,
        this.iconColor= Colors.black,
        this.size=0.0,
        this.circleColor= Colors.grey
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:()=>onPress ,
      child: CircleAvatar(
        backgroundColor: circleColor,
        radius: r,
        child: Icon(
          icon,
          color: iconColor!,
          size: size,
        ),
      ),
    );
  }
}
