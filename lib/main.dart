//import 'dart:js';

//import 'dart:js';

import 'package:firebase_session23/screens/chatpage.dart';
import 'package:firebase_session23/screens/home.dart';
import 'package:firebase_session23/screens/login.dart';
import 'package:firebase_session23/screens/registraion.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: "home",
    routes: {
      "home": (context) => myhome(),
      "registation": (context) => myregistration(),
      "login": (context) => mylogin(),
      "chat": (context) => chatpage(),
    },
    debugShowCheckedModeBanner: false,
  ));
}
