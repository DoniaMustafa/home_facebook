import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  String? imageUrl;
  bool? isActive;
  double? r;
  bool? isBorder;
  double? maxH;
  double? maxW;

  ProfileAvatar({
    this.maxH,
    this.maxW,
    this.r,
    this.isBorder = false,
    this.imageUrl,
    this.isActive = false,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          constraints: BoxConstraints(maxHeight: maxH!, maxWidth: maxW!),
          padding: EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(r!),
            border: Border.all(
                style: isBorder! ? BorderStyle.solid : BorderStyle.none,
                width: isBorder! ? 3 : 0,
                color: Colors.blue),
          ),
          child: CircleAvatar(
              radius: 35.0, backgroundImage: NetworkImage(imageUrl!)),
        ),
        isActive!
            ? Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  height: 15.0,
                  width: 15.0,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
