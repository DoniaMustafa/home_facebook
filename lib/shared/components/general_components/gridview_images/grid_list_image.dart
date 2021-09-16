import 'package:flutter/material.dart';
import 'dart:math';

class PhotoGrid extends StatelessWidget {
  final int maxImages;
  final List<String> imageUrls;
  final Function(int) onImageClicked;
  final Function onExpandClicked;

  PhotoGrid(
      {required this.imageUrls,
        required this.onImageClicked,
        required this.onExpandClicked,
        this.maxImages = 4,
      });

  @override
  Widget build(BuildContext context) {
    var images = buildImages();

    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,

      // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      //   maxCrossAxisExtent: 200,
      //   crossAxisSpacing: 2,
      //   mainAxisSpacing: 2,
      // ),
      children: images,
    );
  }

  List<Widget> buildImages() {
    int numImages = imageUrls.length;
    return List<Widget>.generate(min(numImages,maxImages), (index) {
      String imageUrl = imageUrls[index];

      if (index == maxImages - 1) {
        int remaining = numImages - maxImages;

        if (remaining == 0) {
          return GestureDetector(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
            onTap: () => onImageClicked(index),
          );
        } else {
          return GestureDetector(
            onTap: () => onExpandClicked(),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(imageUrl, fit: BoxFit.cover),
                Positioned.fill(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.black54,
                    child: Text(
                      '+' + remaining.toString(),
                      style: TextStyle(fontSize: 32,color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      } else {
        return GestureDetector(
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
          onTap: () => onImageClicked(index),
        );
      }
    });
  }
}