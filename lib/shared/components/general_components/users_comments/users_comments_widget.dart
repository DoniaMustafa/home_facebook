import 'package:facebook_feed/models/comment_model.dart';
import 'package:facebook_feed/models/users_posts_model.dart';
import 'package:facebook_feed/shared/components/general_components/profile_avatar/profile_ava_widget.dart';
import 'package:facebook_feed/shared/style/def_color.dart';
import 'package:facebook_feed/shared/style/font_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UsersComments extends StatelessWidget {
 final Data commentData;
  final PostsData postsData;
UsersComments({required this.commentData,required this.postsData});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [

          commentsUsers(),
          Positioned(
            top: 0.0,
            left: 0.0,
            child: Container(
              height: 50,
              width: double.infinity,
              child: Row(
                children: [
                  Icon(Icons.thumb_up,color: Colors.blue,),
                  Text('${postsData.likes}',style: black18bold(),),
                  Icon(Icons.arrow_forward_ios,color: Colors.black,
                  size: 25,),
                  Spacer(flex: 1,),
                  Icon(Icons.thumb_up_outlined,
                  color: color(),
                  size: 25,),
                ],
              ),
            ),
          ),
          Positioned(
            width: double.infinity,
              height: 50,
              bottom: 0.0,
              left: 0.0,
              child: Row(children: [],))
        ],
      ),
    );
  }
  Widget commentsUsers() {

    DateTime date = DateTime.parse(commentData.publishDate.toString());
    var outputFormat = DateFormat('MMMM d, yyyy');
    var outputDate = outputFormat.format(date);


    return Row(
  children: [
  ProfileAvatar(
  r: 25,
  maxH: 40,
  maxW: 40,
  imageUrl:commentData.owner!.picture,
  ), SizedBox(width: 10, ),
  Column(
  children: [
  Container(
  decoration: BoxDecoration(color: Colors.grey[300],
  borderRadius: BorderRadius.circular(15.0)),

  child: Column(
  children: [
  Text('${commentData.owner!.firstName} ${commentData.owner!.lastName}', style: black18regular(), ),
  Text(commentData.message!, style: black16regular(), overflow: TextOverflow.ellipsis,
  maxLines: null, )
  ],
  ),
  ),
  SizedBox(height: 5, ),
  Row(
  children: [
  Text('$outputDate',
  style: deepGray14regular(), ),
  SizedBox(width: 5, ),
  Text('Like'),
  SizedBox(width: 5, ),
  Text('Reply')

  ],
  )
  ],
  ),

  ],
  );
}


}
