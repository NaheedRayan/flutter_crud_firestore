import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';





class data_list extends StatefulWidget {
  const data_list({Key? key}) : super(key: key);

  @override
  State<data_list> createState() => _data_listState();
}




class _data_listState extends State<data_list> {

  final Stream<QuerySnapshot> user_data = FirebaseFirestore.instance.collection('user').snapshots();

  List<String>quotes = [
    'Be yourself',
    'I love it',
    'Wait thats illegal'
  ];

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
        child: Container(
          child: Column(
            children: [
              // Column(
              //   children: quotes.map((e){ return Text(e);}).toList(),
              // ),
              Container(
                height:500,
                child: StreamBuilder<QuerySnapshot>(
                  stream: user_data,
                  builder: (BuildContext context , AsyncSnapshot<QuerySnapshot>snapshot,){
                  if(snapshot.hasError)
                    {
                      return Text('Something went wrong');
                    }
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Text('Loading');
                  }

                  final data = snapshot.requireData ;

                  return ListView.builder(
                    itemCount: data.size,
                    itemBuilder: (context,index){
                      return Text('The data is ${data.docs[index]['data']} \n on ${data.docs[index]['year']}');
                    },
                  );
                },),
              ),
              ElevatedButton(onPressed: (){



              }, child: Text('Click to go to home page'))
            ],
          ),

            // quotes.map((quote) => return Text(quote);).toList();

        ),
      ),
    );
  }



}
