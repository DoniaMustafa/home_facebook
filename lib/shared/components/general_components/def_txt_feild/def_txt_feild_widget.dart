import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? txt;
  final IconData? icon;
  final double?  width;
  final double?   height;
  final double? r1;
  final TextStyle? style;

  final double? r2;
   TextFormFieldWidget(
      {this.controller,
        this.style,
      this.txt='',
      this.icon,
      this.width=0.0,
      this.height=30.0,
      this.r1=0.0,
      this.r2=0.0});


  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      constraints: BoxConstraints(
        maxWidth: width!,
        maxHeight: height!
      ),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.bottom,
        controller: controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: txt,
            hintStyle: style,

            prefixIcon: Icon(icon),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(r1!),borderSide: BorderSide.none),
            focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(r2!),borderSide: BorderSide.none),
          fillColor: Colors.grey[300],
          filled: true
        ),)
    );
  }



}
