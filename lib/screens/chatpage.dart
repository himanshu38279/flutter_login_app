import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class chatpage extends StatefulWidget {
  @override
  _chatpageState createState() => _chatpageState();
}

class _chatpageState extends State<chatpage> {
  var msg;
  var authconnect = FirebaseAuth.instance;
  var fs = FirebaseFirestore.instance;

  getlivestream() async {
    await for (var ss in fs.collection('chat').snapshots()) {
      for (var data in ss.docs) {
        print(data.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Page "),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () async {
                Navigator.pushNamed(context, "home");
                await authconnect.signOut();
              })
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            onChanged: (value) {
              msg = value;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'send message',
                hintText: 'Enter Your message'),
          ),
          FlatButton(
              onPressed: () async {
                var addmessage = await fs
                    .collection('chat')
                    .add({"text": msg, "email": authconnect.currentUser.email});
                //  var text =print( msgdoc.docs[0].data());
                // ignore: unnecessary_statements
                // print( text.text);
                print(addmessage);
              },
              child: Text("Send Data")),
          FlatButton(
              onPressed: () async {
                var msgdoc = await fs.collection('chat').get();
                //  var text =print( msgdoc.docs[0].data());
                // ignore: unnecessary_statements
                // print( text.text);
                for (var i in msgdoc.docs) {
                  print(i.data());
                }
                print(msg);
              },
              child: Text("Get Data")),
          FlatButton(
              onPressed: () {
                getlivestream();
              },
              child: Text("live streaming")),
          RaisedButton(
              onPressed: () {
                try {
                  var user = authconnect.currentUser;
                  Fluttertoast.showToast(
                      msg: "user email ${user.email}",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  print(user.email); 
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
              child: Text("know about the user name")),
        ],
      ),
    );
  }
}
