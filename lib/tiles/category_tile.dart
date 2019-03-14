import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store/screens/category_screen.dart';

class CategoryTile extends StatelessWidget {

  final DocumentSnapshot snapshot;

  CategoryTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListTile(
        leading: CircleAvatar(
          radius: 25.0,
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(snapshot.data["icon"]),
        ),
        title: Text(snapshot.data["title"]),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: (){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) =>CategoryScreen(snapshot))
          );
        },
      ),
      alignment: Alignment(0.0, 0.0),
    );


  }
}
