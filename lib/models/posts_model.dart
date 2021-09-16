import 'package:flutter/material.dart';

class PropertyButton {
  final String txt;
  final IconData icon;
  final Color color;

  PropertyButton({required this.color, required this.txt, required this.icon});
}

class PostsInteraction {
  final IconData icon;
  final String txt;

  PostsInteraction({required this.icon, required this.txt});
}

class ListSheet {
  final String title;
  final String subTitle;
  final IconData icon;

  ListSheet({required this.title, required this.subTitle, required this.icon});
}

class SponsoredDeskTob {
  final String title;
  final String subTitle;
  final String image;

  SponsoredDeskTob(
      {required this.title, required this.subTitle, required this.image});
}


class MenuDiskTobModel{
  final String text;
  // final String img;

  MenuDiskTobModel({required this.text,
    // required this.img
  });
}