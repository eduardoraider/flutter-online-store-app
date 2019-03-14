import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData {

  String category;
  String id;

  String title;
  String description;

  double price;

  List images;
  List sizes;

  ProductData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    title = snapshot.data["title"];
    description = snapshot.data["description"];
    price = snapshot.data["price"];
    images = snapshot.data["images"];
    sizes = snapshot.data["sizes"];
  }

  Map<String, dynamic> toResume(){
    return {
      "title": title,
      "description": description,
      "price": price
    };
  }
}
