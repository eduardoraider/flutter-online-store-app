import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceTile extends StatelessWidget {

  final DocumentSnapshot snapshot;

  PlaceTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 100.0,
            child: Image.network(
              snapshot.data["image"],
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  snapshot.data["title"],
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0
                  ),
                ),
                Text(
                  snapshot.data["address"],
                  textAlign: TextAlign.start,
                  ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text("View on Map"),
                textColor: Colors.blue,
                padding: EdgeInsets.zero,
                onPressed: (){
                  launch("https://www.google.com/maps/search/?api=1&query=${snapshot.data["lat"]},${snapshot.data["long"]}");
                },
              ),
              FlatButton(
                child: Text("Call"),
                textColor: Colors.blue,
                padding: EdgeInsets.zero,
                onPressed: (){
                  launch("tel:${snapshot.data["phone"]}");
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
