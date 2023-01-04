import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../read data/get_user_name.dart';
import 'auth_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;
  CollectionReference collection = FirebaseFirestore.instance.collection("users");
  // final users = FirebaseFirestore.instance.collection('users');

  // final FirebaseAuth auth = FirebaseAuth.instance;

  // document IDs
  List<String> docIDs = [];

  // get docIDs
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            }));
  }

  // void inputData() {
  //   final User? user = auth.currentUser;
  //   final uid = user?.uid;
  //   // here you write the codes to input the data into firestore
  // }

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    // get value

    FirebaseFirestore.instance.collection('users').get().then((value) => {
          value.docs.forEach((element) {
            var name = element.data()['first'];
            var lastname = element.data()['last'];
          })
        });

    final dan = FirebaseFirestore.instance.collection('users');

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Color(0xFF07996D),
        title: Text(
          user.email!,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: FutureBuilder(
              future: getDocId(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: docIDs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: GetUserName(
                          documentId: docIDs[index],
                        ),
                        tileColor: Color(0xFF07996D),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      )),
      // body: Center(
      //   child: Text(
      //     'Nom : ${user.displayName!}',
      //     style: TextStyle(
      //       fontSize: 25,
      //     ),
      //   ),
      // ),
    );
  }
}
