import 'package:flutter/material.dart';
import 'package:flutter_store/models/user_model.dart';
import 'package:flutter_store/screens/login_screen.dart';
import 'package:flutter_store/tiles/drawer_tile.dart';
import 'package:scoped_model/scoped_model.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(155, 4, 125, 141),
            Color.fromARGB(95, 4, 125, 141)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        top: 8.0,
                        left: 0.0,
                        child: Text(
                          "Flutter's\nClothing",
                          style: TextStyle(
                              color: Color.fromARGB(255, 4, 125, 141),
                              fontSize: 34.0,
                              fontWeight: FontWeight.bold),
                        )),
                    Positioned(
                        left: 0.0,
                        bottom: 0.0,
                        child: ScopedModelDescendant<UserModel>(
                          builder: (context, child, model) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Hello, ${!model.isLoggedIn() ? "" : model.userData["name"]}",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 4, 125, 141),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                GestureDetector(
                                  child: Text(
                                    !model.isLoggedIn()
                                        ? "Sign in or Register >"
                                        : " Sign out",
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onTap: () {
                                    if(!model.isLoggedIn()) {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen())
                                      );
                                    } else {
                                      model.signOut();
                                    }
                                  },
                                ),
                              ],
                            );
                          },
                        )
                    )
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home, "Home", pageController, 0),
              DrawerTile(Icons.list, "Products", pageController, 1),
              DrawerTile(Icons.location_on, "Stores", pageController, 2),
              DrawerTile(
                  Icons.playlist_add_check, "My Orders", pageController, 3),
            ],
          )
        ],
      ),
    );
  }
}
