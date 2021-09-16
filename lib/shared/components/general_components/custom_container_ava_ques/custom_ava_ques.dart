import 'package:facebook_feed/models/posts_model.dart';
import 'package:facebook_feed/shared/components/default_button/default_button.dart';
import 'package:facebook_feed/shared/components/general_components/general_component.dart';
import 'package:facebook_feed/shared/components/general_components/profile_avatar/profile_ava_widget.dart';
import 'package:facebook_feed/shared/style/font_style.dart';
import 'package:flutter/material.dart';

class CustomAvatarAndQuestion extends StatelessWidget {
  final bool isDiskTob;
  final double basicMaxH;
  final double maxWAvatar;
  final double maxHAvatar;
  final double rediusAvatar;
  final double queheight;
  final double rediusButton;
  final TextStyle txtStyleRoom;
  final TextStyle queTxtStyle;

  CustomAvatarAndQuestion(
      {required this.isDiskTob,
      required this.basicMaxH,
      required this.maxWAvatar,
      required this.maxHAvatar,
      required this.rediusAvatar,
      required this.queheight,
      required this.rediusButton,
      required this.queTxtStyle,
        required this.txtStyleRoom});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      constraints: BoxConstraints(
        maxHeight: basicMaxH,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 10, top: 20,bottom: 5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ProfileAvatar(
                  maxW: maxWAvatar,
                  maxH: maxHAvatar,
                  r: rediusAvatar,
                  imageUrl: 'facebookHome(context).userModel!.data![4].picture',
                  isBorder: false,
                  isActive: false,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: DefaultButton(
                    height: queheight,
                    isBorder: true,
                    isIcon: false,
                    r: rediusButton,
                    width: double.infinity,
                    txt: 'What‘s on your mind?',
                    txtStyle: queTxtStyle,
                    align: Alignment.centerLeft,
                  ),
                )
              ],
            ),
          ),
          Divider(
            endIndent: 10,
            indent: 10,
          ),
          isDiskTob
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: listBottomContainerAvatar
                      .map((PropertyButton button) => Expanded(
                            child: DefaultButton(
                              txt: button.txt,
                              txtStyle: txtStyleRoom,
                              width: double.infinity,
                              r: 0.0,
                              isIcon: true,
                              height: 35,
                              iconColor: button.color,
                              iconSize: 30.0,
                              color: Colors.transparent,
                              icon: button.icon,
                            ),
                          ))
                      .toList(),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:listSecondLine
                      .map((PropertyButton button) => Expanded(
                            child: DefaultButton(
                              txt: button.txt,
                              txtStyle: deepGray16bold(),
                              width: double.infinity,
                              r: 0.0,
                              isIcon: true,
                              height: 40,
                              iconColor: button.color,
                              iconSize: 30.0,
                              color: Colors.transparent,
                              icon: button.icon,
                            ),
                          ))
                      .toList(),
                )
        ],
      ),
    );
  }
}
