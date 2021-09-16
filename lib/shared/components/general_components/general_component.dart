 import 'package:facebook_feed/models/posts_model.dart';
import 'package:facebook_feed/modules/mobile_modules/groups.dart';
import 'package:facebook_feed/modules/mobile_modules/mobile_home_screen.dart';
import 'package:facebook_feed/modules/mobile_modules/notify.dart';
import 'package:facebook_feed/modules/mobile_modules/setting.dart';
import 'package:facebook_feed/modules/mobile_modules/store.dart';
import 'package:facebook_feed/modules/mobile_modules/watch.dart';
import 'package:facebook_feed/modules/tablet_modules/groups_tab_screen.dart';
import 'package:facebook_feed/modules/tablet_modules/home_tablet/home_tab_screen.dart';
import 'package:facebook_feed/modules/tablet_modules/notify_tab_screen.dart';
import 'package:facebook_feed/modules/tablet_modules/setting_tab_screen.dart';
import 'package:facebook_feed/modules/tablet_modules/store_tab_screem.dart';
import 'package:facebook_feed/modules/tablet_modules/watch_tab_screen.dart';
import 'package:facebook_feed/modules/web_modulse/groups_web_screen.dart';
import 'package:facebook_feed/modules/web_modulse/home_web/home_web_screen.dart';
import 'package:facebook_feed/modules/web_modulse/page_web_screen.dart';
import 'package:facebook_feed/modules/web_modulse/store_web_screem.dart';
import 'package:facebook_feed/modules/web_modulse/watch_web_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

 List<Widget> mobileWidget = [
   MobileHomeScreen(),
   GroupsScreen(),
   WatchScreen(),
   StoreScreen(),
   NotificationScreen(),
   SettingScreen()
 ];

 List<ListSheet> listSheet = [
   ListSheet(
       title: 'Save post',
       subTitle: 'Add this to your saved items.',
       icon: Icons.bookmark_outline),
   ListSheet(
       title: 'Add رساله_massage to Favorites',
       subTitle: 'Prioritize their post in News Feed.',
       icon: Icons.star_border),
   ListSheet(
       title: 'Hide post',
       subTitle: 'See fewer posts like this',
       icon: Icons.cancel_presentation_outlined),
   ListSheet(
       title: 'snooze Donia for 30 days',
       subTitle: 'Temporarily stop seeing post ',
       icon: Icons.watch_later_outlined),
   ListSheet(
       title: 'Unfollow Donia',
       subTitle: 'Stop seeing posts but stay friends',
       icon: Icons.person_add_disabled),
   ListSheet(
       title: 'Why am i seeing this post?',
       subTitle: '',
       icon: Icons.info_outline),
   ListSheet(
       title: 'Find support or report post  ',
       subTitle: 'i‘m concerned about this post.',
       icon: Icons.announcement_outlined),
   ListSheet(title: 'View edit history  ', subTitle: '', icon: Icons.edit),
   ListSheet(
       title: 'True on notification for this post',
       subTitle: '',
       icon: Icons.notifications_none),
   ListSheet(title: 'Copy link', subTitle: '', icon: Icons.link),
 ];

 List<PostsInteraction> reactList = [
   PostsInteraction(icon: FontAwesomeIcons.thumbsUp, txt: 'Like'),
   PostsInteraction(icon: FontAwesomeIcons.commentAlt, txt: 'Comment'),
   PostsInteraction(icon: FontAwesomeIcons.share, txt: 'Share'),
 ];

 List<PropertyButton> listSecondLine = [
   PropertyButton(txt: 'Live', icon: Icons.videocam, color: Colors.red),
   PropertyButton(
       txt: 'Photo', icon: Icons.photo_library, color: Colors.green),
   PropertyButton(
       txt: 'Room', icon: Icons.video_call, color: Colors.deepPurpleAccent)
 ];


 List<PropertyButton> listBottomContainerAvatar = [
   PropertyButton(txt: 'Live Video', icon: Icons.videocam, color: Colors.red),
   PropertyButton(
       txt: 'Photo/Video ', icon: Icons.photo_library, color: Colors.green),
   PropertyButton(
       txt: 'Feeling/Activity', icon: Icons.tag_faces, color: Colors.yellow)
 ];
 List<IconData> tabBarIcon = [
   Icons.home_outlined,
   Icons.group_sharp,
   Icons.live_tv,
   Icons.storefront_sharp,
   Icons.notifications_none,
   Icons.dehaze_rounded
 ];

 List<IconData> desktopTabBarIcon = [
   Icons.home_outlined,
   Icons.assistant_photo_outlined,
   Icons.live_tv,
   Icons.storefront_sharp,
   Icons.group_sharp,
 ];
 List<IconData> desktopBarActionIcon = [
   Icons.drag_indicator,
   FontAwesomeIcons.facebookMessenger,
   Icons.notifications_none,
   Icons.arrow_drop_down,
 ];
 List<Widget> diskTobWidget = [
   HomeDiskTobScreen(),
   WatchDiskTobScreen(),
   StoreDiskTobScreen(),
   PageDiskTobScreen(),
   GroupsDiskTobScreen(),

 ];
 List<Widget> tobWidget = [
   HomeDiskTobScreen(),
   WatchDiskTobScreen(),
   StoreDiskTobScreen(),
   PageDiskTobScreen(),
   GroupsDiskTobScreen(),

 ];

 List<Widget> tabletWidget = [
   HomeTabScreen(),
   GroupsTabScreen(),
   WatchTabScreen(),
   StoreTabScreen(),
   NotificationTabScreen(),
   SettingTabScreen()
 ];

 var urls = <String>[
   'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
   'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
   'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
   'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
   'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
   'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
 ];

 // List<MenuDiskTobModel> menuDiskTob= [
 //   MenuDiskTobModel(text:'Donia Mostafa'),
 // ];
 List<String>menuDiskTob=<String>['Donia Mostafa','Friends','MarketPlace',
 'Groups','Saved','Ads','Blood Donations','Community Help','Covid-19 info center','Emotional Heath','Events','Facebook Pay',
 'Favorites ','Friend Lists','Fundraisers','Gaming video','Jobs','Live Videos','Members', 'Messenger'];