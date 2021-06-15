import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class mylogin extends StatefulWidget {
  @override
  _myloginState createState() => _myloginState();
}

class _myloginState extends State<mylogin> {
  var email;
  var password;
  var authconnect = FirebaseAuth.instance;
  bool sspinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login  Page"),
        ),
        body: ModalProgressHUD(
          inAsyncCall: sspinner,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  child: TextField(
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Email Address',
                        hintText: 'Enter Your Email Address'),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Card(
                  child: TextField(
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter Your Password'),
                    obscureText: true,
                  ),
                ),
                RaisedButton(
                  onPressed: () async {
                    print(email);
                    print(password);
                    setState(() {
                      sspinner = true;
                    });
                    try {
                      var checkinfo =
                          await authconnect.signInWithEmailAndPassword(
                              email: email, password: password);
                      print(checkinfo);
                      if (checkinfo != null) {
                        Navigator.pushNamed(context, "chat");
                        setState(() {
                          sspinner = false;
                        });
                      }
                    } catch (e) {
                      print(e);
                      Fluttertoast.showToast(
                          msg: "${e}",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  child: Text("Sign In"),
                )
              ],
            ),
          ),
        ));
  }
}
