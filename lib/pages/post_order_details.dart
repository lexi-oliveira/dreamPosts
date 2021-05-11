import 'package:dreamposts/pages/home/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

class PostOrderDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MyAppBar(),
        ],
      ),
    );
  }
}
