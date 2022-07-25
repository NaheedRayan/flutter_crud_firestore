import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var data = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CRUD APP"),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),


        body:Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(

                children: [
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0,0,5,0),
                        child: TextField(
                          decoration: const InputDecoration(

                            border: OutlineInputBorder(),
                            labelText: 'Enter a text',
                          ),
                          controller: data,
                        ),
                      )),
                  ElevatedButton(
                      onPressed: (){
                        final name = data.text ;
                        createUser(name :name);
                      },
                      child:Text('ADD')

                  )
                ],
              ),
              SizedBox(height: 50),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, '/list_page');
              },
                  child: Text('Press to go to next page'))

            ],
          ),

        )
    );
  }

  Future createUser({required String name}) async {

    final docUser = FirebaseFirestore.instance.collection("user").doc();
    final json = {
      'data' :name,
      'year':DateTime.now(),
    };

    await docUser.set(json);
  }
}
