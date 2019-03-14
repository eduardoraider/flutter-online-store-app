import 'package:flutter/material.dart';
import 'package:flutter_store/models/cart_model.dart';
import 'package:flutter_store/models/user_model.dart';
import 'package:flutter_store/screens/home_screen.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: ScopedModelDescendant<UserModel>(builder: (context, child, model) {
        return ScopedModel<CartModel>(
          model: CartModel(model),
          child: MaterialApp(
            title: "Flutter's Clothing",
            theme: ThemeData(
                primarySwatch: Colors.green,
                primaryColor: Color.fromARGB(255, 4, 125, 141)),
            home: HomeScreen(),
            debugShowCheckedModeBanner: false,
          ),
        );
      }),
    );
  }
}
