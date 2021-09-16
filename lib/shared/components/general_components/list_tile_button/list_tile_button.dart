import 'package:facebook_feed/shared/components/general_components/profile_avatar/profile_ava_widget.dart';
import 'package:flutter/material.dart';

class ListTileButton extends StatelessWidget {
   IconData? icon;
   Color? color;
   double? r;
   String txt;
   TextStyle txtStyle;
   bool isIcon;
   bool? isActive;
   bool? isBorder;
   double? radiusImg;
   double? maxH;
   double? maxW;
   String? imageUrl;
   Function? onPress;
  ListTileButton(

      {this.icon,
      this.color,
      this.r,
      required this.txt,
      required this.txtStyle,
      required this.isIcon,
      this.isActive,
      this.isBorder,
      this.radiusImg,
      this.maxH,
      this.maxW,
      this.imageUrl,
        this.onPress
      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print('ok');
        return onPress!();},
      child: ListTile(

      leading : isIcon
       ? CircleAvatar(
           backgroundColor: color,
           radius: r,
           child: Icon(
             icon,
           ),
         )
       : ProfileAvatar(
           isActive: isActive,
           maxH: maxH,
           imageUrl: imageUrl,
           r: radiusImg,
           isBorder: isBorder,
           maxW: maxW,
         ),
       title: Text(
         txt,
         style: txtStyle,
       )
      ),
    );
  }
}
