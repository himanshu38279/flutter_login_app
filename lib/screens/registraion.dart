import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class myregistration extends StatefulWidget {
  @override
  _myregistrationState createState() => _myregistrationState();
}

class _myregistrationState extends State<myregistration> {
  var email;
  var password;
  var authconnect = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Regitration Page"),
        ),
        body: Column(
          children: <Widget>[
            Card(
              child: TextField(
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email Address',
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
                try {
                  print(email);
                  print(password);
                  var user = await authconnect.createUserWithEmailAndPassword(
                      email: email, password: password);
                  print(user);
                  if (user != null) {
                    Navigator.pushNamed(context, "login");
                  }
                } catch (e) {
                  print(e);
                  Fluttertoast.showToast(
                      msg: "$e",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              },
              child: Text("Register"),
            )
          ],
        ));
  }
}
