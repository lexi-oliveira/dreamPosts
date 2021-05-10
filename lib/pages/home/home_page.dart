import 'package:dreamposts/pages/home/widgets/my_app_bar.dart';
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
    double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Stack(
        // empilhar os componentes da página
        children: <Widget>[
          MyAppBar(),
          Positioned(
            top: _screenHeight * .14,
            height: _screenHeight * .86,
            left: 0,
            right: 0,
            child: PageView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      //borderRadius: BorderRadius.circular(5),
                    ),
                    child: ListView.separated(
                      padding: const EdgeInsets.all(5),
                      itemCount: widget.posts.length,
                      itemBuilder: (BuildContext context, int index) {
                        final post = widget.posts[index];
                        return Container(
                          height: 250,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            children: <Widget>[
                              Text(
                                post.title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
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
                                post.body,
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                          /* Text(
                            post.title,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,

                            ),
                          ), */
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(
                        height: 15,
                        thickness: 1.5,
                        indent: 30,
                        endIndent: 30,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ),
                /* Container(
                  color: Colors.white,
                ), */
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/* @override
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
  } */

/* child: PageView(
                            children: <Widget>[
                              Text(
                                post.title,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                color: Colors.green,
                                child: Text(
                                  post.body,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ), */
