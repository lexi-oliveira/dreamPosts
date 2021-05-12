import 'package:flutter/material.dart';
import 'package:dreamposts/models/post.dart';

class ShowPost extends StatefulWidget {
  final Post post;
  final double titleSize;
  final double bodySize;
  ShowPost({this.post, this.titleSize, this.bodySize});

  @override
  _ShowPostState createState() => _ShowPostState();
}

class _ShowPostState extends State<ShowPost> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          widget.post.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: widget.titleSize,
          ),
        ),
        const Divider(
          height: 20,
          thickness: 0.5,
          indent: 90,
          endIndent: 90,
          color: Colors.grey,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          widget.post.body,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: widget.bodySize,
          ),
        ),
      ],
    );
  }
}
