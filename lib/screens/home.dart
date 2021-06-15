import 'package:flutter/material.dart';

class myhome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home page"),
        ),
        body: Center(
          child: Container(
            alignment: Alignment.center,
            //margin: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.android),
                        onPressed: () => print("icon Click")),
                    RaisedButton(
                      onPressed: () {
                        print("clicked regiter");
                        Navigator.pushNamed(context, "registation");
                      },
                      child: Text("Register"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.repeat_one),
                        onPressed: () => print("icon Click")),
                    RaisedButton(
                      onPressed: () {
                        print("clicked login");
                        Navigator.pushNamed(context, "login");
                      },
                      child: Text("login"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
