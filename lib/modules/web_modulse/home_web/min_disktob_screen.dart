import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:facebook_feed/models/users_posts_model.dart';
import 'package:facebook_feed/modules/web_modulse/home_web/home_web_screen.dart';
import 'package:facebook_feed/shared/components/cubit/home_cubit.dart';
import 'package:facebook_feed/shared/components/cubit/home_state.dart';
import 'package:facebook_feed/shared/components/default_button/def_circle_button.dart';
import 'package:facebook_feed/shared/components/default_button/default_button.dart';
import 'package:facebook_feed/shared/components/general_components/constans.dart';
import 'package:facebook_feed/shared/components/general_components/container_user_posts/user_posts_widget.dart';
import 'package:facebook_feed/shared/components/general_components/custom_container_ava_ques/custom_ava_ques.dart';
import 'package:facebook_feed/shared/components/general_components/profile_avatar/profile_ava_widget.dart';
import 'package:facebook_feed/shared/components/general_components/story/story.dart';
import 'package:facebook_feed/shared/style/font_style.dart';
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
          builder: (context) => Container(
            child: UserPosts(
              postsData: facebookHome(context).postsData!,
            ),
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