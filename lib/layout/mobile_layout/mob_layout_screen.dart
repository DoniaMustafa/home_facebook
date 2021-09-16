import 'package:facebook_feed/shared/components/default_button/def_circle_button.dart';
import 'package:facebook_feed/shared/components/general_components/constans.dart';
import 'package:facebook_feed/shared/components/cubit/home_cubit.dart';
import 'package:facebook_feed/shared/components/cubit/home_state.dart';
import 'package:facebook_feed/shared/components/general_components/custom_tab_view/custom_tab_widget.dart';
import 'package:facebook_feed/shared/components/general_components/general_component.dart';
import 'package:facebook_feed/shared/style/font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MobLayoutScreen extends StatefulWidget {
  @override
  _MobLayoutScreenState createState() => _MobLayoutScreenState();
}

class _MobLayoutScreenState extends State<MobLayoutScreen>
    {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FacebookHomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              toolbarHeight:facebookHome(context).controller!.index == 0?112:48,
              flexibleSpace: SafeArea(
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                   if( facebookHome(context).controller!.index== 0)
                    TitleAndActionMobWidget(),
                    CustomTabBar(
                      controller:facebookHome(context).controller ,
                      icons: tabBarIcon,
                      selectedIndex: facebookHome(context).controller!.index,
                      onTap: (int i)=> facebookHome(context).changeSelectColor(i),
                      iconSize: 30,
                    )
                  ],
                ),
              ),
              centerTitle: false,
              // floating: true,
            ),

            body: TabBarView(
                controller: facebookHome(context).controller,
                children: mobileWidget),
          );
        },
        listener: (context, state) {});
  }


}
class TitleAndActionMobWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(children: [
        Text('facebook', textAlign: TextAlign.start, style: blueTitleMob()),
        Spacer(
          flex: 1,
        ),
        actionButtonBar()
      ]),
    );
  }
  Widget actionButtonBar ()=>Row(
    children: [
      DefaultCircleButtonIcon(icon: FontAwesomeIcons.search,r: 22.0,size: 25,
        circleColor: Colors.grey[200],
        onPress: (){},),
      SizedBox(width: 10,),
      DefaultCircleButtonIcon(icon: FontAwesomeIcons.facebookMessenger,r: 22.0,size: 25,circleColor: Colors.grey[200],
          onPress: (){}),
    ],
  );
}
