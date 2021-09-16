import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:facebook_feed/models/users_posts_model.dart';
import 'package:facebook_feed/shared/components/general_components/constans.dart';
import 'package:facebook_feed/shared/components/cubit/home_cubit.dart';
import 'package:facebook_feed/shared/components/cubit/home_state.dart';
import 'package:facebook_feed/shared/components/general_components/container_user_posts/user_posts_widget.dart';
import 'package:facebook_feed/shared/components/general_components/custom_container_ava_ques/custom_ava_ques.dart';
import 'package:facebook_feed/shared/components/general_components/simmer_animation/shimmer_animation_loading.dart';
import 'package:facebook_feed/shared/components/general_components/story/story.dart';
import 'package:facebook_feed/shared/style/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FacebookHomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: facebookHome(context).userPosts != null,
          builder: (context) => Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  customContainerAvatar(context),
                  Divider(
                    thickness: 20,
                  ),
                  customUserStoriesWidget(
                      postsData: facebookHome(context).postsData!),
                  Divider(
                    thickness: 20,
                  ),
                  ListView.separated(
                    itemBuilder: (context, int index) => customUserPosts(
                      // id: facebookHome(context).userPosts!.data![index].id.toString(),
                        context: context,
                        postsData:
                            facebookHome(context).userPosts!.data![index],
                        i: index),
                    separatorBuilder: (context, i) => Divider(
                      thickness: 20,
                    ),
                    itemCount: facebookHome(context).userPosts!.data!.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                  )
                ],
              ),
            ),
          ),
          fallback: (context) => ShimmerAnimationLoading(
            isDiskTob: false,
          ),
        );
      },
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
        isDiskTob: false,
        maxWAvatar: 50,
        maxHAvatar: 50,
        rediusAvatar: 30,
        queheight: 40,
        rediusButton: 20,
        queTxtStyle: black20regular(),
        txtStyleRoom: deepGray16bold(),
      );

  Widget customUserPosts(

          {required context,
            // required String id/
          required PostsData postsData,
          required int i,
          // required Data commentData
          }) =>
      CustomPostsOfUser(
        // onPress: (){
        // },
        titleSheetStyle: black16bold(),
        subTitleSheetStyle: black14regular(),
        isMobOrTab: true,
        postsData: postsData,
        i: i,
        maxHAvatar: 40.0,
        maxWAvatar: 40.0,
        postTxtStyle: black18regular(),
        radiusAvatar: 30.0,
        reactHeight: 50,
        reactIconSize: 20,
        reactTxtStyle: deepGray16regular(),
        userNameStyle: black18boldw900(),
        // dataComment: comment,
      );
}


