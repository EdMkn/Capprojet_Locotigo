import 'package:flutter/material.dart';
import 'dart:async';
import 'main.dart';
import 'create_account_next.dart';

class Page3 extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  bool valuefirst = false;
  bool valuesecond = false;
  bool isChecked = false;
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
            Text(
              "Création du compte",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              //Use of SizedBox
              height: 30,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 10, //<-- SEE HERE
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Nom utilisateurs',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                decoration: InputDecoration(
                  filled: true, //<-- SEE HERE
                  fillColor: Color(0xffffffff),
                  border: OutlineInputBorder(),
                  hintText: 'Nom utilisateurs',
                ),
              ),
            ),
            SizedBox(
              //Use of SizedBox
              height: 10,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 10, //<-- SEE HERE
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Mot de passe',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                decoration: InputDecoration(
                  filled: true, //<-- SEE HERE
                  fillColor: Color(0xffffffff),
                  border: OutlineInputBorder(),
                  hintText: 'Mot de passe',
                ),
              ),
            ),
            SizedBox(
              //Use of SizedBox
              height: 10,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 10, //<-- SEE HERE
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Entrez le nouveau mot de passe a nouveau',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                decoration: InputDecoration(
                  filled: true, //<-- SEE HERE
                  fillColor: Color(0xffffffff),
                  border: OutlineInputBorder(),
                  hintText: 'Entrez le nouveau mot de passe a nouveau',
                ),
              ),
            ),
            SizedBox(
              //Use of SizedBox
              height: 10,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 10, //<-- SEE HERE
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Adresse',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                decoration: InputDecoration(
                  filled: true, //<-- SEE HERE
                  fillColor: Color(0xffffffff),
                  border: OutlineInputBorder(),
                  hintText: 'Ex:176 Grande rue',
                ),
              ),
            ),
            SizedBox(
              //Use of SizedBox
              height: 10,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 10, //<-- SEE HERE
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Adresse e-mail',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                decoration: InputDecoration(
                  filled: true, //<-- SEE HERE
                  fillColor: Color(0xffffffff),
                  border: OutlineInputBorder(),
                  hintText: 'Adresse e-mail',
                ),
              ),
            ),
            SizedBox(
              //Use of SizedBox
              height: 10,
            ),
            Text(
              "êtes-vous un producteur ?",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Row(children: <Widget>[
              SizedBox(
                width: 105,
              ),
              Text(
                'Oui ',
                style: TextStyle(fontSize: 17.0),
              ),
              Checkbox(
                checkColor: Colors.greenAccent,
                activeColor: Colors.red,
                value: this.valuefirst,
                onChanged: (bool? value) {},
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                'Non ',
                style: TextStyle(fontSize: 17.0),
              ),
              Checkbox(
                checkColor: Colors.greenAccent,
                activeColor: Colors.red,
                value: this.valuefirst,
                onChanged: (bool? value) {},
              ),
            ]),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Page4();
                }));
              },
              child: Text('Suivant'),
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(), primary: Color(0xe2ff1e00)),
            ),
          ],
        ),
      ),
    );
  }
}
