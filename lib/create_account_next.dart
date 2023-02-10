import 'package:flutter/material.dart';
import 'package:helloworld/create_account.dart';
import 'package:helloworld/login.dart';
import 'dart:async';
import 'main.dart';
import 'Confirmation.dart';

/// Classe de création de compte producteur
class Page4 extends StatelessWidget {
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
            Row(
              children: [
                SizedBox(
                  //Use of SizedBox
                  width: 20,
                ),
                // Image tapped
                InkWell(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Page3()),
                        ),
                    child: Image.network(
                      'https://img.icons8.com/ios-filled/50/null/chevron-left.png',
                      width: 12,
                      height: 12,
                      fit: BoxFit.cover,
                    )),
              ],
            ),
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
                    'Raison sociale',
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
                  hintText: 'Texte',
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
                    'Forme juridique',
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
                  hintText: 'EIRL',
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
                    'SIRET',
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
                  hintText: 'Numero 13 chiffres',
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
                    'Activite',
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
                  hintText: 'Code APE /NAP',
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
                    'Numero tva',
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
                  hintText: 'Ex: 12  3435 45 3 5 3 45',
                ),
              ),
            ),
            SizedBox(
              //Use of SizedBox
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Page5();
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
