import 'package:dreamposts/models/post.dart';
import 'package:dreamposts/components/my_app_bar.dart';
import 'package:dreamposts/components/show_post.dart';
import 'package:flutter/material.dart';

class PostOrderDetails extends StatelessWidget {
  final Post post;
  final double titleSize = 24;
  final double bodySize = 18;

  PostOrderDetails(this.post);

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MyAppBar(),
          Positioned(
            top: _screenHeight * .13,
            height: _screenHeight * .87,
            left: 0,
            right: 0,
            child: PageView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      ShowPost(
                        post: post,
                        titleSize: titleSize,
                        bodySize: bodySize,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, true);
        }, //não tem parênteses pois chama a função
        child: BackButtonIcon(),
        backgroundColor: Colors.pink,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
