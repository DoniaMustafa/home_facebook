import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:facebook_feed/models/comment_model.dart';
import 'package:facebook_feed/models/users_posts_model.dart';
import 'package:facebook_feed/shared/components/cubit/home_cubit.dart';
import 'package:facebook_feed/shared/components/cubit/home_state.dart';
import 'package:facebook_feed/shared/components/default_button/def_circle_button.dart';
import 'package:facebook_feed/shared/components/default_button/default_button.dart';
import 'package:facebook_feed/shared/components/general_components/constans.dart';
import 'package:facebook_feed/shared/components/general_components/container_user_posts/user_posts_widget.dart';
import 'package:facebook_feed/shared/components/general_components/custom_container_ava_ques/custom_ava_ques.dart';
import 'package:facebook_feed/shared/components/general_components/general_component.dart';
import 'package:facebook_feed/shared/components/general_components/list_tile_button/list_tile_button.dart';
import 'package:facebook_feed/shared/components/general_components/profile_avatar/profile_ava_widget.dart';
import 'package:facebook_feed/shared/components/general_components/story/story.dart';
import 'package:facebook_feed/shared/style/def_color.dart';
import 'package:facebook_feed/shared/style/font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDiskTobScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FacebookHomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: facebookHome(context).userPosts != null &&
              state is GetPostsSuccessState,
          builder: (context) => Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  child: MoreOptionList(),
                ),
              ),
              const Spacer(),
              Container(
                width: 600,
                child: UserPosts(
                  postsData: facebookHome(context).postsData!,
                ),
              ),
              const Spacer(),
              Flexible(
                flex: 1,
                child: Container(
                  child: OnlineUsers(),
                ),
              ),
            ],
          ),
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

class UserPosts extends StatelessWidget {
  final List<PostsData>? postsData;
  UserPosts({this.postsData});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FacebookHomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            customUserStoriesWidget(postsData: postsData!),
            SizedBox(
              height: 20,
            ),
            customContainerAvatar(context),
            SizedBox(
              height: 20,
            ),
            customCreateRoomContainer(facebookHome(context).owner!, context),
            SizedBox(
              height: 20,
            ),
            ListView.separated(
              itemBuilder: (context, int index) => customUserPosts(
                  postsData: facebookHome(context).userPosts!.data![index],
                  i: index),
              separatorBuilder: (context, i) => SizedBox(
                height: 20,
              ),
              itemCount: facebookHome(context).userPosts!.data!.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
            )
          ],
        ),
      ),
    );
  }

  Widget customUserStoriesWidget({required List<PostsData> postsData}) =>
      Container(
        height: 250,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int i) =>
                  usersStory(postsData[i].owner!, i),
              itemCount: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: DefaultCircleButtonIcon(
                r: 20,
                icon: Icons.arrow_forward,
                iconColor: Colors.black45,
                size: 20,
                circleColor: Colors.white,
                onPress: () {},
              ),
            )
          ],
        ),
      );
  Widget usersStory(Owner? owner, int i) => StoryWidget(
        i: i,
        mF: 0.0,
        pictureMaxH: 100,
        mR: 10,
        r: 10.0,
        r1: 10.0,
        pictureMaxW: 110,
        avatarRadius: 25.0,
        basicMaxH: 150.0,
        leftAvatarPos: 10.0,
        topAvatarPos: 15.0,
        maxAvatarH: 50.0,
        maxAvatarW: 50.0,
        leftUserNamePos: 10.0,
        bottomUserNamePos: 15.0,
        owner: owner,
        textStyle: black18regular().copyWith(color: Colors.white),
        textStyle1: black18bold(),
      );
  Widget customContainerAvatar(context) => CustomAvatarAndQuestion(
        basicMaxH: 140,
        isDiskTob: true,
        maxWAvatar: 50,
        maxHAvatar: 50,
        rediusAvatar: 30,
        queheight: 40,
        rediusButton: 20,
        queTxtStyle: black20regular(),
        txtStyleRoom: deepGray16bold(),
      );

  Widget customCreateRoomContainer(Owner owner, context) => Container(
      padding: EdgeInsets.all(10.0),
      width: double.infinity,
      constraints: BoxConstraints(
        maxHeight: 50,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          ListView.builder(
            itemBuilder: (context, i) =>
                userAvatar(facebookHome(context).userPosts!.data![i], context),
            itemCount: 9,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
          ),
          Positioned(
            right: 10,
            top: 25,
            child: DefaultCircleButtonIcon(
              r: 35,
              onPress: () {},
              circleColor: Colors.white,
              size: 20,
              iconColor: Colors.black54,
              icon: Icons.arrow_forward_ios,
            ),
          ),
        ],
      ));
  Widget userAvatar(PostsData? owner, context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 1),
        child: owner == facebookHome(context).userPosts!.data![0]
            ? Expanded(
                child: DefaultButton(
                  color: Colors.transparent,
                  isBorder: true,
                  height: 10,
                  width: 170,
                  isIcon: true,
                  iconSize: 30,
                  icon: Icons.video_call,
                  iconColor: Color.lerp(Colors.indigo, Colors.deepPurple, 10),
                  r: 25,
                  txt: 'Create Room',
                  txtStyle: black18regular().copyWith(color: Colors.indigo),
                ),
              )
            : ProfileAvatar(
                isBorder: false,
                r: 25,
                isActive: true,
                imageUrl: owner!.owner!.picture,
                maxH: 50,
                maxW: 50,
              ));
  }

  Widget customUserPosts({required PostsData postsData, required int i}) =>
      Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
        child: CustomPostsOfUser(
          // onPress: (){},
          titleSheetStyle: black18bold(),
          subTitleSheetStyle: black14bold(),
          isMobOrTab: false,
          userNameStyle: black18boldw900(),
          postsData: postsData,
          i: i,
          maxHAvatar: 40.0,
          maxWAvatar: 40.0,
          postTxtStyle: black20regular(),
          radiusAvatar: 30.0,
          reactHeight: 30,
          reactIconSize: 20,
          reactTxtStyle: deepGray16regular(),
          // dataComment: comment,
        ),
      );
}

class OnlineUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sponsored',
                    style: black18boldw900(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (context, i) => sponsored(),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Contact',
                        style: deepGray20bold(),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      DefaultCircleButtonIcon(
                        icon: Icons.search,
                        size: 25,
                        r: 20,
                        iconColor: color(),
                        circleColor: Colors.transparent,
                        onPress: () {},
                      ),
                      DefaultCircleButtonIcon(
                        icon: Icons.video_call,
                        size: 25,
                        r: 20,
                        iconColor: color(),
                        circleColor: Colors.transparent,
                        onPress: () {},
                      ),
                      DefaultCircleButtonIcon(
                        icon: Icons.more_horiz,
                        size: 25,
                        r: 20,
                        iconColor: color(),
                        circleColor: Colors.transparent,
                        onPress: () {},
                      ),
                    ],
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: facebookHome(context).postsData!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, i) =>
                        contact(facebookHome(context).postsData![i].owner!),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Group Conversations',
                    style: deepGray18bold(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  group()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sponsored() => InkWell(
        onTap: () {},
        child: ListTile(
          title: Text(
            'donia mostafa madbouly aly badawy donia mostafa madbouly aly badawy',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: black18bold(),
          ),
          subtitle: Text(
            'dondondony@gmail.con',
            style: deepGray16regular(),
          ),
          leading: Container(
            // width: 75,
            height: 300,
            child: Image.network(
              'https://media-exp1.licdn.com/dms/image/C560BAQHMnA03XDdf3w/company-logo_200_200/0/1519855918965?e=2159024400&v=beta&t=CrP5Le1mWICRcaxIGNBuajHcHGFPuyNA5C8DI339lSk',
              fit: BoxFit.fill,
              height: 300,
            ),
          ),
        ),
      );

  Widget contact(Owner owner) => ListTileButton(
        txt: '${owner.firstName} ${owner.lastName}',
        txtStyle: black20regular(),
        isIcon: false,
        maxW: 50,
        maxH: 50,
        radiusImg: 30,
        isActive: true,
        imageUrl: owner.picture,
        r: 0,
        isBorder: false,
        color: Colors.transparent,
      );

  Widget group() => ListTileButton(
        isIcon: true,
        txt: 'Create New Group',
        txtStyle: black18regular(),
        r: 20,
        color: Colors.grey[200],
        icon: Icons.add,
      );
}

class MoreOptionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, i) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTileButton(
                txt: menuDiskTob[i],
                txtStyle: black20bold(),
                isIcon: false,
                radiusImg: 20,
                imageUrl:
                    'https://media-exp1.licdn.com/dms/image/C560BAQHMnA03XDdf3w/company-logo_200_200/0/1519855918965?e=2159024400&v=beta&t=CrP5Le1mWICRcaxIGNBuajHcHGFPuyNA5C8DI339lSk',
                maxH: 50,
                maxW: 50,
                isBorder: false,
                isActive: false,
              ),
            ),
            itemCount:
            // facebookHome(context).visible! ?
            menuDiskTob.length ,
                // : 4,
            // shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ),
        ),
        // ListTileButton(
        //   onPress: () => facebookHome(context).visibleMenu(),
        //   txt: facebookHome(context).visible! ? 'See Less' : 'See More',
        //   txtStyle: black18bold(),
        //   isIcon: true,
        //   r: 25,
        //   icon: Icons.keyboard_arrow_down,
        //   color: Colors.grey[200],
        // ),
        Divider(),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, i) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTileButton(
                txt: 'donia mostafa',
                txtStyle: black20bold(),
                isIcon: false,
                radiusImg: 20,
                imageUrl:
                    'https://media-exp1.licdn.com/dms/image/C560BAQHMnA03XDdf3w/company-logo_200_200/0/1519855918965?e=2159024400&v=beta&t=CrP5Le1mWICRcaxIGNBuajHcHGFPuyNA5C8DI339lSk',
                maxH: 50,
                maxW: 50,
                isBorder: false,
                isActive: false,
              ),
            ),
            itemCount: 6,
            // shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ),
        ),
      ],
    );
  }
}
