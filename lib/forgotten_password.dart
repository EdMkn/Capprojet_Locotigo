import 'package:flutter/material.dart';
import 'package:helloworld/password.dart';
import 'dart:async';
import 'main.dart';
import 'create_account_next.dart';
import 'login.dart';
import 'Map.dart';

class Page7 extends StatelessWidget {
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
              height: 90,
            ),
            Text(
              "MOT DE PASSE OUBLIÉ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              //Use of SizedBox
              height: 90,
            ),
            Text(
              "vous allez recevoir un lien afin de rénitialiser votre mot de passe",
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
