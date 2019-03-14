import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  final String orderId;

  OrderScreen(this.orderId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("Order Completed"),
      centerTitle: true,
    ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.check,
            color: Theme.of(context).primaryColor,
            size: 80.0,
            ),
            Text("Order successfully!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            textAlign: TextAlign.center,
            ),
            Text("Purchase code: $orderId", style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
