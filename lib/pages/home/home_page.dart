import 'package:dreamposts/components/displaying_post_list.dart';
import 'package:dreamposts/components/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dreamposts/models/post.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  var posts = new List<Post>();

  HomePage() {
    posts = [];
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future fetchPost() async {
    // função que faz a requisição dos posts
    final response =
        await http.get(Uri.https('jsonplaceholder.typicode.com', 'posts/'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<Post> result = (json.decode(response.body) as List)
          .map((data) => Post.fromJson(data))
          .toList();

      setState(() {
        widget.posts = result;
      });
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  _HomePageState() {
    // toda vez que a aplicação iniciar
    // irá fazer a requisição na api e trazer os posts
    fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Stack(
        // empilha os componentes da página
        children: <Widget>[
          MyAppBar(),
          DisplayingPostList(widget.posts),
        ],
      ),
    );
  }
}
