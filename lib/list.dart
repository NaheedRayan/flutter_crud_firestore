import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



class data_list extends StatefulWidget {
  const data_list({Key? key}) : super(key: key);

  @override
  State<data_list> createState() => _data_listState();
}

class _data_listState extends State<data_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List page"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text('Yay'),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('Click here to go back'))
          ],
        ),
      ),
    );
  }
}
