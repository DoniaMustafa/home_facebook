import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:facebook_feed/models/comment_model.dart';
import 'package:facebook_feed/models/users_posts_model.dart';
import 'package:facebook_feed/shared/components/general_components/constans.dart';
import 'package:facebook_feed/shared/components/cubit/home_cubit.dart';
import 'package:facebook_feed/shared/components/cubit/home_state.dart';
import 'package:facebook_feed/shared/components/general_components/container_user_posts/user_posts_widget.dart';
import 'package:facebook_feed/shared/components/general_components/custom_container_ava_ques/custom_ava_ques.dart';
import 'package:facebook_feed/shared/components/general_components/story/story.dart';
import 'package:facebook_feed/shared/style/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabScreen extends StatelessWidget {
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
                mainAxisSize: MainAxisSize.max,
                children: [
                  customContainerAvatarProfile(context),
                  Divider(
                    thickness: 20,
                  ),
                  customUserStories(
                      postsData: facebookHome(context).postsData!),
                  Divider(
                    thickness: 20,
                  ),
                  ListView.separated(
                    itemBuilder: (context, i) => postOfUsersCustom(
                        postsData: facebookHome(context).postsData![i], i: i),
                    itemCount: facebookHome(context).postsData!.length,
                    separatorBuilder: (context, i) => Divider(
                      thickness: 20,
                    ),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       Expanded(
                  //           flex: 1,
                  //           child: ProfileAvatar(
                  //               r: 35,
                  //               imageUrl: facebookHome(context).userModel!.data![5].picture,
                  //           maxW: 40.0,
                  //           maxH: 40.0,)),
                  //       Expanded(
                  //         flex: 6,
                  //         child: DefaultButton(
                  //           isIcon: false,
                  //           align: Alignment.centerLeft,
                  //           height: 50,
                  //         width: double.infinity,
                  //         txt: 'What‘s on your mind?',
                  //         color: Colors.transparent,
                  //         r: 20,
                  //         isBorder: true,
                  //         txtStyle: black20regular(),)
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Divider(),
                  // Container(
                  //   alignment: Alignment.center,
                  //   constraints: BoxConstraints(maxHeight: 50,
                  //                       maxWidth: double.infinity
                  //                     ),
                  //                     child: Row(
                  //
                  //          children: List.generate(
                  //         listSecondLine.length,
                  //         (index) => Expanded(
                  //           child: DefaultButton(
                  //             isIcon: true,
                  //             icon: listSecondLine[index].icon,
                  //             txt: listSecondLine[index].txt,
                  //             iconColor: listSecondLine[index].color,
                  //             r: 0.0,
                  //             iconSize: 35,
                  //             height: 50,
                  //             width: double.infinity,
                  //             color: Colors.transparent,
                  //           ),
                  //         )),
                  //   ),
                  // ),
                  // Divider(
                  //   thickness: 15,
                  // ),
                  // Container(
                  //   constraints: BoxConstraints(maxHeight: 280),
                  //   child: ListView.builder(
                  //     shrinkWrap: true,
                  //     itemBuilder: (context, index) =>
                  //         myStoryTab(facebookHome(context).userPosts!.data![index],
                  //             facebookHome(context).userPosts!.data![index].owner!),
                  //     itemCount: 20,
                  //     scrollDirection: Axis.horizontal,
                  //   ),
                  // ),
                  // Divider(
                  //   thickness: 15,
                  // ),
                  // Container(
                  //   constraints: BoxConstraints(),
                  //   child: ListView.separated(
                  //       shrinkWrap: true,
                  //       physics: NeverScrollableScrollPhysics(),
                  //       itemBuilder: (context, index) => listPostsTabWidget(
                  //           context,
                  //           facebookHome(context)
                  //               .userPosts!
                  //               .data![index]
                  //               .owner!,
                  //           facebookHome(context).userPosts!.data![index],
                  //           index),
                  //       separatorBuilder: (context, index) => Divider(
                  //             thickness: 15,
                  //           ),
                  //       itemCount:
                  //           facebookHome(context).userPosts!.data!.length),
                  // )
                ],
              ),
            ),
          ),
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget customContainerAvatarProfile(context) => CustomAvatarAndQuestion(
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

  Widget customUserStories({required List<PostsData> postsData}) => Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        height: 250,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int i) =>
                  usersStory(postsData[i].owner!, i),
              itemCount: 8,
            ),
          ],
        ),
      );
  Widget usersStory(Owner? owner, int i) => StoryWidget(
        i: i,
        mF: 0.0,
        pictureMaxH: 120,
        mR: 10,
        r: 10.0,
        r1: 10.0,
        pictureMaxW: 120,
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

  Widget postOfUsersCustom(
          {
          required PostsData postsData,
          required int i}) =>
      CustomPostsOfUser(
        // onPress: (){},
        titleSheetStyle: black18bold(),
        subTitleSheetStyle: black14bold(),
        isMobOrTab: true,
        postsData: postsData,
        i: i,
        maxHAvatar: 40.0,
        maxWAvatar: 40.0,
        postTxtStyle: black22regular(),
        radiusAvatar: 30.0,
        reactHeight: 40,
        reactIconSize: 20,
        reactTxtStyle: deepGray16regular(),
        userNameStyle: black18boldw900(),
        // dataComment: comment,
      );
}
