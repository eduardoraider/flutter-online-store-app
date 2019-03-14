import 'package:flutter/material.dart';
import 'package:flutter_store/tabs/home_tab.dart';
import 'package:flutter_store/tabs/orders_tab.dart';
import 'package:flutter_store/tabs/places_tab.dart';
import 'package:flutter_store/tabs/products_tab.dart';
import 'package:flutter_store/widgets/cart_button.dart';
import 'package:flutter_store/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
          floatingActionButton: CartButton(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Products"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: ProductsTab(),
          floatingActionButton: CartButton(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Stores"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: PlacesTab(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("My Orders"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: OrdersTab(),
        )
      ],
    );
  }
}
