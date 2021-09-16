import 'package:facebook_feed/models/comment_model.dart';
import 'package:facebook_feed/models/posts_model.dart';
import 'package:facebook_feed/models/users_posts_model.dart';
import 'package:facebook_feed/shared/components/default_button/default_button.dart';
import 'package:facebook_feed/shared/components/general_components/constans.dart';
import 'package:facebook_feed/shared/components/general_components/def_sheet_button/sheet_button_tab_widg.dart';
import 'package:facebook_feed/shared/components/general_components/general_component.dart';
import 'package:facebook_feed/shared/components/general_components/gridview_images/grid_list_image.dart';
import 'package:facebook_feed/shared/components/general_components/profile_avatar/profile_ava_widget.dart';
import 'package:facebook_feed/shared/components/general_components/users_comments/users_comments_widget.dart';
import 'package:facebook_feed/shared/style/def_color.dart';
import 'package:facebook_feed/shared/style/font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomPostsOfUser extends StatelessWidget {
  final double maxHAvatar;
  final PostsData postsData;
  final double reactIconSize;
  CommentsModel? commentsModel;
 Data? comment;
final double reactHeight;
  final TextStyle reactTxtStyle;
  final TextStyle postTxtStyle;
  final TextStyle userNameStyle;
  final int i;
  final double radiusAvatar;
  final double maxWAvatar;
  final bool isMobOrTab;
  final TextStyle subTitleSheetStyle;
  final TextStyle titleSheetStyle;
  CustomPostsOfUser(
      {required this.subTitleSheetStyle,
      required this.titleSheetStyle,
      required this.maxHAvatar,
      required this.postsData,
      required this.userNameStyle,
      required this.reactIconSize,
      required this.reactHeight,
      required this.reactTxtStyle,
      required this.postTxtStyle,
      required this.i,
      // required this.onPress,
      required this.radiusAvatar,
      required this.maxWAvatar,
      required this.isMobOrTab});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(10.0),
      // margin:EdgeInsets.all(10.0),
      constraints: BoxConstraints(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          userInfo(context: context),
          customContentOfUser(
            context: context,
            postsData: postsData,
            i: i,
            postTxtStyle: postTxtStyle,
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: postsReaction(
              context: context,
            ),
          )
        ],
      ),
    );
  }

  Widget userInfo({
    required context,
  }) {
    DateTime date = DateTime.parse(postsData.publishDate.toString());
    var outputFormat = DateFormat('MMMM d, yyyy');
    var outputDate = outputFormat.format(date);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(
            maxW: maxWAvatar,
            maxH: maxHAvatar,
            r: radiusAvatar,
            imageUrl: postsData.owner!.picture,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${postsData.owner!.firstName} ${postsData.owner!.lastName}',
                style: userNameStyle,
              ),
              Row(
                children: [
                  Text(outputDate),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.public,
                    size: 20,
                    color: color(),
                  )
                ],
              ),
            ],
          ),
          Spacer(
            flex: 1,
          ),
          IconButton(
              onPressed: () {
                if (isMobOrTab) {
                  showModalBottomSheet(
                    context: context,
                    builder: (builder) => Container(
                      constraints: BoxConstraints(maxHeight: 800),
                      child: ListView.builder(
                        itemBuilder: (context, i) => buttonSheet(
                          listSheet[i],
                        ),
                        itemCount: listSheet.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                      ),
                    ),
                    isScrollControlled: true,
                  );
                }
              },
              icon: Icon(
                Icons.more_horiz,
                size: 25,
              ))
        ],
      ),
    );
  }

  Widget buttonSheet(ListSheet listSheet) => DefaultSheetButton(
        subtitle: listSheet.subTitle,
        leadingIcon: listSheet.icon,
        title: listSheet.title,
        listSheet: listSheet,
        titleStyle: titleSheetStyle,
        subTitleStyle: subTitleSheetStyle,
        size: 20,
        color: color(),
      );

  Widget customContentOfUser(
          {context, int? i, PostsData? postsData, TextStyle? postTxtStyle}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (facebookHome(context).userPosts!.data![i!] !=
              facebookHome(context).userPosts!.data![2])
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: MediaQuery(
                data: MediaQueryData(textScaleFactor: 1),
                child: Text(
                  '${postsData!.text}',
                  textAlign: TextAlign.start,
                  maxLines: 3,
                  style: postTxtStyle,
                ),
              ),
            ),
          if (facebookHome(context).userPosts!.data![i] ==
              facebookHome(context).userPosts!.data![2])
            ConstrainedBox(
              constraints: BoxConstraints(),
              child: PhotoGrid(
                imageUrls: urls,
                onImageClicked: (i) {},
                onExpandClicked: () {},
                maxImages: 4,
              ),
            ),
          if ((facebookHome(context).userPosts!.data![i] ==
                  facebookHome(context).userPosts!.data![1]) ||
              (facebookHome(context).userPosts!.data![i] ==
                  facebookHome(context).userPosts!.data![3]))
            Container(
              constraints: BoxConstraints(maxHeight: double.infinity),
              child: Image.network(
                '${postsData!.image!}',
                fit: BoxFit.cover,
              ),
            ),
        ],
      );

  Widget postsReaction({
    required context,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (postsData.likes != 0)
                Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.thumb_up_outlined,
                        color: color(),
                        size: 15,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${postsData.likes}',
                        style: deepGray16regular(),
                      )
                    ],
                  ),
                ),
              // Spacer(flex: 1,),
              // if( facebookHome(context).commentsModel!.data!.isNotEmpty)
              //   Container(
              //     child: Row(
              //       children: [
              //         Text(
              //           '${facebookHome(context).commentsModel!.data![i].message!.length}',
              //           style: deepGray16regular(),
              //         ),
              //         SizedBox(
              //           width: 10,
              //         ),
              //         Text(
              //           'Comment',
              //           style: deepGray16regular(),
              //         )
              //       ],
              //     ),
              //   )
            ],
          ),
          Divider(
            indent: 10,
            endIndent: 10,
          ),
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                react(
                    onPress: () {},
                    txt: 'Like',
                    icon: Icons.thumb_up_outlined,
                    size: reactIconSize,
                    txtStyle: reactTxtStyle),
                react(
                    onPress: () {
                      print('kd');
                      return facebookHome(context)
                          .getComment(facebookHome(context)
                              .userModel!
                              .data![i]
                              .id
                              .toString())
                          .then((value) {
                        commentsModel =commentsModelFromJson(value.toString());

                            return showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (builder) => SafeArea(
                                      child: ListView.builder(
                                    // shrinkWrap: true,

                                    itemBuilder: (context, i) => commentsModel !=
                                            null
                                        ? (
                                        commentsModel!.data!.isNotEmpty?
                                        UsersComments(
                                      postsData: postsData,
                                      commentData: commentsModel!
                                          .data![i],
                                    )
                                            : Center(child: Text('There are no comments',style: black20bold(),),)):Center(
                                        child: CircularProgressIndicator()),
                                    itemCount: commentsModel!
                                        .data!
                                        .length,
                                  )
                              ));
                          });
                    },
                    txt: 'Comment',
                    icon: Icons.chat_bubble_outline,
                    size: reactIconSize,
                    txtStyle: reactTxtStyle),
                react(
                    onPress: () {},
                    txt: 'Share',
                    icon: Icons.share,
                    size: reactIconSize,
                    txtStyle: reactTxtStyle),

                // reaction(
                //   onPress: () {},
                //   post: reactList[0],
                //   reactHeight: reactHeight,
                //   reactIconSize: reactIconSize,
                //   reactTxtStyle: reactTxtStyle,
                // ),
                // reaction(
                //   onPress: () {},
                //   post: reactList[1],
                //   reactHeight: reactHeight,
                //   reactIconSize: reactIconSize,
                //   reactTxtStyle: reactTxtStyle,
                // ),
                // reaction(
                //   onPress: () {},
                //   post: reactList[2],
                //   reactHeight: reactHeight,
                //   reactIconSize: reactIconSize,
                //   reactTxtStyle: reactTxtStyle,
                // ),
              ]

              // List.generate(
              //   reactList.length,
              //   (index) => reaction(
              //     onPress: () {},
              //     post: reactList[index],
              //     reactHeight: reactHeight,
              //     reactIconSize: reactIconSize,
              //     reactTxtStyle: reactTxtStyle,
              //   ),
              // ),
              // if(reactList[index].txt=='Comment'){
              //     facebookHome(context).getComment(postsData.id!);
              // showModalBottomSheet(
              //     isScrollControlled: true,
              //     context: context,
              //     builder: (builder) => Container(
              //       child: ListView.builder(itemBuilder: (context,i)=>UsersComments(
              //         postsData: postsData, commentData: dataComment,
              //       ),
              //         itemCount: facebookHome(context).commentsModel!.data!.length,
              //
              //       ),
              //     )
              //
              // );
              // }

              ),
          //   ),
          // )
        ],
      );

  Widget reaction(
          {required PostsInteraction post,
          required TextStyle reactTxtStyle,
          required double reactIconSize,
          required double reactHeight,
          required Function onPress}) =>
      Expanded(
        child: DefaultButton(
          onPress: onPress,
          r: 0.0,
          txt: post.txt,
          color: Colors.transparent,
          txtStyle: reactTxtStyle,
          iconColor: color(),
          icon: post.icon,
          iconSize: reactIconSize,
          isIcon: true,
          width: 100,
          height: reactHeight,
        ),
      );
  Widget react(
          {required String txt,
          required TextStyle txtStyle,
          required double size,
          required IconData icon,
          required Function onPress}) =>
      Expanded(
        child: InkWell(
          onTap: () {
            print('df');

            return onPress();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: size,
                color: color(),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                txt,
                style: txtStyle,
              )
            ],
          ),
        ),
      );
}
