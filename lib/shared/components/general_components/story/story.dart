import 'package:facebook_feed/models/users_posts_model.dart';
import 'package:facebook_feed/shared/components/default_button/def_circle_button.dart';
import 'package:facebook_feed/shared/components/general_components/constans.dart';
import 'package:facebook_feed/shared/components/general_components/profile_avatar/profile_ava_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoryWidget extends StatelessWidget {
  final Owner? owner;
  final double? basicMaxH;
  final double? r;
  final double? r1;
  final double? avatarRadius;
  final double? leftAvatarPos;
  final double? topAvatarPos;
  final double? maxAvatarH;
  final double? maxAvatarW;
  final double? leftUserNamePos;
  final double? bottomUserNamePos;
  final TextStyle? textStyle;
  final TextStyle? textStyle1;

  final double? pictureMaxW;
  final double? mF;
  final double? mR;
  final int? i;
  final double? pictureMaxH;
  StoryWidget(
      {this.mF,
      this.pictureMaxH,
      this.i,
        this.r,
        this.r1,

        this.pictureMaxW,
      this.owner,
      this.basicMaxH,
      this.avatarRadius,
      this.leftAvatarPos,
      this.topAvatarPos,
      this.maxAvatarH,
      this.maxAvatarW,
      this.leftUserNamePos,
      this.bottomUserNamePos,
      this.textStyle,
      this.textStyle1,
      this.mR});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10, left: mF!, right: mR!),
      constraints: BoxConstraints(maxWidth: basicMaxH!),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(r!),
      ),
      child: owner == facebookHome(context).userPosts!.data![0].owner
          ? Stack(
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: pictureMaxW!),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        constraints: BoxConstraints(maxHeight: 150),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0)),
                          image: DecorationImage(
                              image: NetworkImage('${owner!.picture}'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.bottomCenter,
                          constraints: BoxConstraints(maxWidth: pictureMaxW!),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0)),
                          ),
                          child: Text(
                            'Create Story',
                            style: textStyle1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 130,
                  left: 30,
                  child: CircleAvatar(
                           backgroundColor: Colors.white,
                           radius: 25,
                           child: Icon(
                             Icons.add,
                           ),
                         )
                )
              ],
            )
          : Stack(
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: pictureMaxW!),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(r1!),
                      image: DecorationImage(
                          image: NetworkImage('${owner!.picture}'),
                          fit: BoxFit.fill)),
                ),
                Positioned(
                    left: leftAvatarPos,
                    top: topAvatarPos,
                    child: ProfileAvatar(
                      r: avatarRadius!,
                      maxH: maxAvatarH!,
                      maxW: maxAvatarW!,
                      isBorder: true,
                      imageUrl: owner!.picture,
                      isActive: false,
                    )),
                Positioned(
                  right: 10,
                  left: leftUserNamePos,
                  bottom: bottomUserNamePos,
                  child: Text(
                    '${owner!.firstName} ${owner!.lastName}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    style: textStyle,
                  ),
                ),
              ],
            ),
    );
  }
}
