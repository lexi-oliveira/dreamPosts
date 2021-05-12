import 'package:dreamposts/components/post_list.dart';
import 'package:flutter/material.dart';

class DisplayingPostList extends StatefulWidget {
  var posts = [];

  DisplayingPostList(this.posts);

  @override
  _DisplayingPostListState createState() => _DisplayingPostListState();
}

class _DisplayingPostListState extends State<DisplayingPostList> {
  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    return Positioned(
      //determina a posição na tela da PageView que contém a lista de posts
      top: _screenHeight * .13,
      height: _screenHeight * .87,
      left: 0,
      right: 0,
      child: PageView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              //container para preenchimendo do fundo roxo
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              child: PostList(widget.posts), //widget que exibe a lista de posts
            ),
          ),
        ],
      ),
    );
  }
}
