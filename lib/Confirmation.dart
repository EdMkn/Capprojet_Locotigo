import 'package:flutter/material.dart';
import 'dart:async';
import 'main.dart';
import 'login.dart';

/// Cette classe représente la page de confirmation d'email
/// 
/// Le cas de figure est la creation de compte
class Page5 extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.alphaBlend(Color(0xffa6ec55), Colors.lightGreenAccent),
      body: Center(
        child: Column(
          children: <Widget>[
            Align(
                alignment: Alignment.topRight,
                child: Image.asset("assets/images/LOGO4.png", height: 45)),
            SizedBox(
              //Use of SizedBox
              height: 60,
            ),
            Text(
              "E-mail de confirmation",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              //Use of SizedBox
              height: 180,
            ),
            Text(
              "vous allez recevoir un lien par E-mail afin d’activer votre compte",
              style: TextStyle(fontSize: 15, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              //Use of SizedBox
              height: 40,
            ),
            new SizedBox(
              width: 300,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Login();
                  }));
                },
                child: Text('Retour'),
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(), primary: Color(0xe2ff1e00)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
