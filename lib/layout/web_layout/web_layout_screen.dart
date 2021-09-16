import 'package:facebook_feed/shared/components/default_button/def_circle_button.dart';
import 'package:facebook_feed/shared/components/general_components/constans.dart';
import 'package:facebook_feed/shared/components/cubit/home_cubit.dart';
import 'package:facebook_feed/shared/components/cubit/home_state.dart';
import 'package:facebook_feed/shared/components/general_components/custom_tab_view/custom_tab_widget.dart';
import 'package:facebook_feed/shared/components/general_components/def_txt_feild/def_txt_feild_widget.dart';
import 'package:facebook_feed/shared/components/general_components/general_component.dart';
import 'package:facebook_feed/shared/components/general_components/profile_avatar/profile_ava_widget.dart';
import 'package:facebook_feed/shared/style/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WebLayoutScreen extends StatefulWidget {
  @override
  _WebLayoutScreenState createState() => _WebLayoutScreenState();
}

class _WebLayoutScreenState extends State<WebLayoutScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FacebookHomeCubit()
        ..initialControllerDiskTob(this)
        ..getPosts(),
      child: BlocConsumer<FacebookHomeCubit, HomeState>(
          builder: (context, state) {
            return LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  print(constraints.minWidth.toInt());
              if (constraints.minWidth.toInt() == 840) {
                return Scaffold(
                  backgroundColor: Color(0xfffEEF0F3),
                  appBar: PreferredSize(
                    child: CustomAppBarMinDiskTob(),
                    preferredSize: Size(double.infinity, 55.0),
                  ),
                  body: TabBarView(
                    children: tobWidget,
                    controller: facebookHome(context).diskController,
                  ),
                );
              } else {
                return Scaffold(
                  backgroundColor: Color(0xfffEEF0F3),
                  appBar: PreferredSize(
                    child: CustomAppBar(),
                    preferredSize: Size(double.infinity, 55.0),
                  ),
                  body: TabBarView(
                    children: diskTobWidget,
                    controller: facebookHome(context).diskController,
                  ),
                );
              }
            });
          },
          listener: (context, state) {}),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                children: [
                  ProfileAvatar(
                    imageUrl:
                        'https://cdn-icons-png.flaticon.com/512/145/145802.png',
                    r: 50,
                    isBorder: false,
                    maxH: 60,
                    maxW: 55,
                  ),
                  search(context),
                ],
              ),
            ),
          ),
          Container(
            width: 600,
            alignment: Alignment.bottomCenter,
            child: CustomTabBar(
              controller: facebookHome(context).diskController,
              iconSize: 25,
              icons: desktopTabBarIcon,
              selectedIndex: facebookHome(context).diskController!.index,
              onTap: (int i) => facebookHome(context).changeSelectColor(i),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ProfileAvatar(
                  maxW: 30,
                  maxH: 30,
                  r: 25,
                  imageUrl:
                      'https://cdn-icons-png.flaticon.com/512/145/145802.png',
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Donia'),
                ActionAppBat()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget search(context) => TextFormFieldWidget(
        controller: facebookHome(context).searchControl,
        style: deepGray14regular(),
        r2: 20,
        r1: 20,
        icon: Icons.search,
        txt: 'Search Facebook',
        height: 30,
        width: 250,
      );
}

class ActionAppBat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          desktopBarActionIcon.length, (index) => actionAppBar(context, index)),
    );
  }

  Widget actionAppBar(context, int i) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: DefaultCircleButtonIcon(
          r: 15,
          onPress: () {},
          circleColor: Colors.grey[200],
          size: i == 1 ? 15 : 20,
          iconColor: Colors.black,
          icon: desktopBarActionIcon[i],
        ),
      );
}


class CustomAppBarMinDiskTob extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                children: [
                  ProfileAvatar(
                    imageUrl:
                    'https://cdn-icons-png.flaticon.com/512/145/145802.png',
                    r: 50,
                    isBorder: false,
                    maxH: 60,
                    maxW: 55,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  DefaultCircleButtonIcon(onPress: (){},
                  size: 20,
                  r: 25,
                  icon: Icons.search,
                  iconColor: Colors.black,
                  circleColor: Colors.grey[200],)
                ],
              ),
            ),
          ),
          Container(
            width: 600,
            alignment: Alignment.bottomCenter,
            child: CustomTabBar(
              controller: facebookHome(context).diskController,
              iconSize: 25,
              icons: desktopTabBarIcon,
              selectedIndex: facebookHome(context).diskController!.index,
              onTap: (int i) => facebookHome(context).changeSelectColor(i),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ProfileAvatar(
                  maxW: 30,
                  maxH: 30,
                  r: 25,
                  imageUrl:
                  facebookHome(context).userModel!.data![6].picture,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('${facebookHome(context).userModel!.data![6].firstName} ${facebookHome(context).userModel!.data![6].lastName}'),
                ActionAppBat()
              ],
            ),
          )
        ],
      ),
    );
  }

}

class ActionAppBatMinDiskTob extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          desktopBarActionIcon.length, (index) => actionAppBar(context, index)),
    );
  }

  Widget actionAppBar(context, int i) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: DefaultCircleButtonIcon(
      r: 15,
      onPress: () {},
      circleColor: Colors.grey[200],
      size: i == 1 ? 15 : 20,
      iconColor: Colors.black,
      icon: desktopBarActionIcon[i],
    ),
  );
}