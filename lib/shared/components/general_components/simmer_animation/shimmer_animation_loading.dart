import 'package:facebook_feed/shared/components/general_components/story/story.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShimmerAnimationLoading extends StatefulWidget {
  final bool isDiskTob;

  @override
  _ShimmerAnimationLoadingState createState() =>
      _ShimmerAnimationLoadingState();

  ShimmerAnimationLoading({required this.isDiskTob});
}

class _ShimmerAnimationLoadingState extends State<ShimmerAnimationLoading>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<Color?>? animationOneColor;
  Animation<Color?>? animationTowColor;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animationOneColor =
        ColorTween(begin: Colors.black26, end: Colors.grey.shade100)
            .animate(_controller!);
    animationTowColor =
        ColorTween(begin: Colors.grey.shade100, end: Colors.black26)
            .animate(_controller!);

    _controller!.forward();
    _controller!.addListener(() {
      if (_controller!.status == AnimationStatus.completed) {
        _controller!.reverse();
      }
      if (_controller!.status == AnimationStatus.dismissed) {
        _controller!.forward();
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (react) {
        return LinearGradient(
                colors: [animationOneColor!.value!, animationOneColor!.value!])
            .createShader(react);
      },

      child: SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              customAvatarAndQuestionAnimation(),

              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 200
                ),
                child: ListView.builder(
                  itemBuilder: (context, i) => storyAnimation(),
                  itemCount: 3,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                ),
              ),
              if (widget.isDiskTob)
              SizedBox(
                height: 10,
              ),
              if (widget.isDiskTob) Expanded(child: customRoomAnimation()),
              SizedBox(
                height: 10,
              ),
              ListView.separated(
                separatorBuilder:(context, i)=>SizedBox(height: 10,) ,
                itemBuilder: (context, i) => postCustomUsers(),
                itemCount: 3,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget storyAnimation() => Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          margin: EdgeInsets.only(top: 10, bottom: 10, right: 10),
          width: 100,
        ),
      );

  Widget customAvatarAndQuestionAnimation() => Container(
        // margin: EdgeInsets.all(10.0),
        color: Colors.transparent,
        width: double.infinity,
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Container(
                    height: 15,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ))
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                child:
                    Row(

                        mainAxisAlignment: MainAxisAlignment.center, children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      height: 20,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      height: 20,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      height: 20,
                    ),
                  ),
                ]))
          ],
        ),
      );

  Widget customRoomAnimation() => Container(
      padding: EdgeInsets.all(10.0),
      width: double.infinity,
      constraints: BoxConstraints(
        maxHeight: 30,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          ListView.builder(
            itemBuilder: (context, i) => CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
            ),
            itemCount: 9,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
          ),
        ],
      ));

  Widget postCustomUsers() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white,
                    height: 10,
                    width: 75,
                  ),
                  SizedBox(height: 5,),
                  Container(
                    height: 10,
                    color: Colors.white,
                    width: 50,
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30,
            vertical: 10),
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0)
            ),

          ),
        ],
      );
}
