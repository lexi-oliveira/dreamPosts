import 'package:dreamposts/models/post.dart';
import 'package:dreamposts/pages/home/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

class PostOrderDetails extends StatelessWidget {
  Post post;

  PostOrderDetails(this.post);

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
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
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Text(
                        post.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
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
                        style: TextStyle(
                          fontSize: 18,
                        ),
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
