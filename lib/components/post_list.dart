import 'package:flutter/material.dart';
import 'package:dreamposts/components/show_post.dart';
import 'package:dreamposts/pages/post_order_details.dart';

class PostList extends StatefulWidget {
  var posts = [];

  PostList(this.posts);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(30),
      itemCount: widget.posts.length,
      itemBuilder: (BuildContext context, int index) {
        final post = widget.posts[index];
        return Container(
            //container que exibe o conteúdo de um post
            height: 250,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: InkWell(
              //widget que chama a página com os detalhes de um post após clicar nele
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostOrderDetails(
                        post), //chamada da página com os detalhes de um post
                  ),
                );
              },
              child: ShowPost(
                //widget responsável por exibir um post
                post: post,
                titleSize: 18,
                bodySize: 14,
              ),
            ));
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(
        height: 15,
        thickness: 1.5,
        indent: 30,
        endIndent: 30,
        color: Colors.pink,
      ),
    );
  }
}
