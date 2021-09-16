import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData>? icons;
  final int? selectedIndex;
  final Function(int)? onTap;
  final TabController? controller;
  final double? iconSize;

  CustomTabBar({
    this.iconSize,
    this.controller,
    this.icons,
    this.selectedIndex,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(

      controller: controller,
      indicatorPadding: EdgeInsets.zero,

      tabs: icons!
          .asMap()
          .map((index, e) => MapEntry(
                index,
                Tab(iconMargin: EdgeInsets.all(0.0),
                  icon: Icon(
                    e,
                    color:
                        index == selectedIndex ? Colors.blue : Colors.black45,
                    size: iconSize,
                  ),
                ),
              ))
          .values
          .toList(),
      onTap: onTap,
    );
  }
}

