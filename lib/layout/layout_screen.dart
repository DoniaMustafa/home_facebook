import 'package:facebook_feed/layout/mobile_layout/mob_layout_screen.dart';
import 'package:facebook_feed/layout/tablet_layout/tab_layout_screen.dart';
import 'package:facebook_feed/layout/web_layout/web_layout_screen.dart';
import 'package:facebook_feed/shared/components/cubit/home_cubit.dart';
import 'package:facebook_feed/shared/components/cubit/home_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LayoutScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FacebookHomeCubit, HomeState>(
        builder: (context, state) {
          return ScreenTypeLayout(
            mobile: MobLayoutScreen(),
            tablet: TabletLayoutScreens(),
            desktop: WebLayoutScreen(),
            breakpoints: ScreenBreakpoints(desktop: 800, tablet: 600, watch: 300),
          );
        },
        listener: (context, state) {});
  }


}

// }
// else {
//   return Scaffold(
//     appBar: AppBar(
//       toolbarHeight: 65,
//       bottom: TabBar(
//         controller: facebookHome(context).controller,
//         // isScrollable: true,
//         indicatorWeight: facebookHome(context).icon.length.toDouble(),
//         // // indicatorSize: TabBarIndicatorSize.label,
//         indicatorColor: Colors.blue,
//         tabs: List.generate(
//           facebookHome(context).icon.length,
//           (index) => Icon(
//             facebookHome(context).icon[index],
//             color: Colors.black,
//             size: 30,
//           ),
//         ),
//       ),
//     ),
//     body: TabBarView(
//         controller: facebookHome(context).controller,
//         children: facebookHome(context).widget),
//   );
// }

// Column(
//   children: [
//     if (facebookHome(context).controller!.index == 0)
//       Row(
//         children: [
//           Spacer(
//             flex: 1,
//           ),
//           DefaultButton(
//             icon: FontAwesomeIcons.search,
//           ),
//           SizedBox(
//             width: 5.0,
//           ),
//           DefaultButton(
//             icon: FontAwesomeIcons.facebookMessenger,
//           )
//         ],
//       ),
//     SizedBox(
//       height: 8.0,
//     ),
//     Container(
//       child: TabBar(
//         labelColor: Colors.blue,
//         controller: facebookHome(context).controller,
//         indicatorWeight:
//             facebookHome(context).icon.length.toDouble(),
//         indicatorColor: Colors.blue,
//         tabs: List.generate(
//           facebookHome(context).icon.length,
//           (index) => Icon(
//             facebookHome(context).icon[index],
//             color: Colors.black,
//             size: 30,
//           ),
//         ),
//       ),
//     ),
//   ],
// ),
//     :null,

// Material(
// child: SafeArea(
// child: Column(
// children: [
// Container(
// height:facebookHome(context).controller!.index == 0? 100:56,
// child: Column(
// children: [
// if (facebookHome(context).controller!.index == 0)
// Padding(
// padding: const EdgeInsets.only(left: 15.0,right: 15,top: 10),
// child: Row(
// children: [
// Text('facebook',
// // textAlign: TextAlign.end,
// style: blueTitle()),
// Spacer(
// flex: 1,
// ),
// DefaultButton(
// icon: FontAwesomeIcons.search,
// ),
// SizedBox(
// width: 5.0,
// ),
// DefaultButton(
// icon: FontAwesomeIcons.facebookMessenger,
// )
// ],
// ),
// ),
// SizedBox(
// height: 10.0,
// ),
// Container(
// alignment: Alignment.center,
// child: TabBar(
// controller: facebookHome(context).controller,
// indicatorWeight:
// facebookHome(context).icon.length.toDouble(),
// // // indicatorSize: TabBarIndicatorSize.label,
// indicatorColor: Colors.blue,
// tabs: List.generate(
// facebookHome(context).icon.length,
// (index) => Container(
// alignment: Alignment.center,
// child: Icon(
// facebookHome(context).icon[index],
// color: Colors.black,
// size: 30,
// ),
// ),
// ),
// ),
// ),
// ],
// ),
// ),
// Divider(),
// Expanded(
// child: Container(
// child: TabBarView(
// controller: facebookHome(context).controller,
// children: facebookHome(context).widget),
// ),
// ),
// ],
// ),
// ),
// );
