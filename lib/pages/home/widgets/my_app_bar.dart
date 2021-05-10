import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        Container(
          color: Colors.purple,
          height: 80,
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              Image.asset(
                'assets/images/dreamlabs.png',
                height: 40,
                alignment: Alignment.centerLeft,
              ),
              SizedBox(
                width: 80,
              ),
              Text(
                '_dream posts',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
