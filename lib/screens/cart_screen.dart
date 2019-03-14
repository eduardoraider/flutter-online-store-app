import 'package:flutter/material.dart';
import 'package:flutter_store/models/cart_model.dart';
import 'package:flutter_store/models/user_model.dart';
import 'package:flutter_store/screens/login_screen.dart';
import 'package:flutter_store/screens/order_screen.dart';
import 'package:flutter_store/tiles/cart_tile.dart';
import 'package:flutter_store/widgets/cart_price.dart';
import 'package:flutter_store/widgets/discount_cart.dart';
import 'package:flutter_store/widgets/ship_card.dart';
import 'package:scoped_model/scoped_model.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 8.0),
            alignment: Alignment.center,
            child: ScopedModelDescendant<CartModel>(
              builder: (context, child, model) {
                int p = model.products.length;
                return Text(
                  "${p ?? 0} ${p == 1 ? "ITEM" : "ITEMS"}",
                  style: TextStyle(fontSize: 17.0),
                );
              },
            ),
          )
        ],
      ),
      body: ScopedModelDescendant<CartModel>(builder: (context, child, model) {
        if (model.isLoading && UserModel.of(context).isLoggedIn()) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (!UserModel.of(context).isLoggedIn()) {
          return Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.remove_shopping_cart,
                  size: 80.0,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Login to add products",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16.0,
                ),
                RaisedButton(
                  child: Text(
                    "Log in",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                )
              ],
            ),
          );
        } else if (model.products == null || model.products.length == 0) {
          return Center(
            child: Text(
              "No products in the cart!",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          );
        } else {
          return ListView(
            children: <Widget>[
              Column(
                children: model.products.map((product) {
                  return CartTile(product);
                }
                ).toList(),
              ),
              DiscountCart(),
              ShipCard(),
              CartPrice(() async {
                String orderId = await model.finishOrder();
                if(orderId != null)
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context)=>OrderScreen(orderId))
                  );
              }),
            ],
          );
        }
      }),
    );
  }
}
