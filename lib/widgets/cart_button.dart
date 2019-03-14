import 'package:flutter/material.dart';
import 'package:flutter_store/screens/cart_screen.dart';

class CartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.shopping_cart, color: Colors.white,),
      ),
      onPressed: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>CartScreen())
        );
      },
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
