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
    final response =
        await http.get(Uri.https('jsonplaceholder.typicode.com', 'posts/'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      /* List<UserModel> users = (json.decode(response.body) as List).map((data) => UserModel.fromJson(data)).toList();
       Post.fromJson(jsonDecode(response.body)); */
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
    // irá fazer a requisição na api
    fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        leading: Align(
          alignment: Alignment.center,
          child: Image.asset(
            'assets/images/dreamlabs.png',
            height: 40.0,
            width: 80.0,
          ),
        ),
        title: Text('DreamPosts'),
      ),
      body: ListView.builder(
          //constrói dinamicamente baseado no tamanho dos posts
          itemCount: widget.posts.length,
          itemBuilder: (BuildContext ctxt, int index) {
            final post = widget.posts[index];
            //constante utilizada para evitar a repetição de código

            return Dismissible(
              child: CheckboxListTile(
                title: Text(post.title),
                value: false, //valor true ou false
                onChanged:
                    (value) {}, //o que será executado quando clicar marcar a caixa
              ),
              key: Key(post.id.toString()),
              background: Container(
                color: Colors.red.withOpacity(0.2),
              ), //o container quando criado toma o espaço total que é permitido
              onDismissed: (direction) {},
            );
          }),
    );
  }
}
