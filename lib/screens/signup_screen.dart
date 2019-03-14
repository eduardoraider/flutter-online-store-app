import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_store/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';


class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Create Account"),
          centerTitle: true,
        ),
        body: ScopedModelDescendant<UserModel>(
            builder: (context, child, model) {
              if(model.isLoading)
                return Center(child: CircularProgressIndicator(),);

              return Form(
                key: _formKey,
                child: ListView(
                  padding: EdgeInsets.all(16.0),
                  children: <Widget>[
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(hintText: "Full name"),
                      validator: (text) {
                        if (text.isEmpty) return "Invalid name!";
                      },
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(hintText: "Email"),
                      keyboardType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.none,
                      validator: (text) {
                        if(text.isEmpty || !text.contains("@")) return "Invalid email!";
                      },
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      controller: _passController,
                      decoration: InputDecoration(hintText: "Password"),
                      obscureText: true,
                      validator: (text) {
                        if (text.isEmpty || text.length < 6)
                          return "Invalid password!";
                      },
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      controller: _addressController,
                      decoration: InputDecoration(hintText: "Address"),
                      validator: (text) {
                        if (text.isEmpty) return "Invalid address!";
                      },
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    SizedBox(
                      height: 44.0,
                      child: RaisedButton(
                        child: Text(
                          "Create Account",
                          style: TextStyle(fontSize: 18.0),
                        ),
                        textColor: Colors.white,
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {

                            Map<String, dynamic> userData = {
                              "name": _nameController.text,
                              "email": _emailController.text,
                              "address": _addressController.text
                            };

                            model.signUp(
                                userData: userData,
                                pass: _passController.text,
                                onSuccess: _onSuccess,
                                onFail: _onFail
                            );
                          }
                        },
                      ),
                    )
                  ],
                ),
              );
            }));
  }

  void _onSuccess(){
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(content: Text("Registered user successfully!"),
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(seconds: 2),)
    );
    Future.delayed(Duration(seconds: 2)).then((_){
      Navigator.of(context).pop();
    });
  }

  void _onFail(){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Failed to register user!"),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),)
    );
  }

}
