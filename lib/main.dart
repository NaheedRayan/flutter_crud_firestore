

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud_firestore/home.dart';
import 'package:flutter_crud_firestore/list.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: Home(),

    // initialRoute: '/home',

    routes: {
      '/home' : (context) =>  Home(),
      '/list_page' : (context) => data_list(),
    },

  ));
}

