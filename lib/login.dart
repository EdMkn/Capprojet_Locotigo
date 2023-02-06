import 'package:flutter/material.dart';
import 'dart:async';
import 'main.dart';
import 'create_account.dart';
import 'password.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.alphaBlend(const Color(0xffa6ec55), Colors.lightGreenAccent),
      body: Center(
        child: Column(
          children: <Widget>[
            Align(
                alignment: Alignment.topRight,
                child: Image.asset("assets/images/LOGO4.png", height: 45)),

            const Text(
              "Connexion",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              //Use of SizedBox
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  filled: true, //<-- SEE HERE
                  fillColor: Color(0xffffffff),
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                  labelText: 'Email',
                ),
              ),
            ),
            const SizedBox(
              //Use of SizedBox
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  filled: true, //<-- SEE HERE
                  fillColor: Color(0xffffffff),
                  border: OutlineInputBorder(),
                  hintText: 'Mot de passe',
                  labelText: 'Mot de passe',
                ),
              ),
            ),
            const SizedBox(
              //Use of SizedBox
              height: 35,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Se Connecter'),
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(), primary: Colors.red),
            ),
            SizedBox(
              //Use of SizedBox
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Page6();
                }));
              },
              child: Text('Mot de passe oublié'),
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(), primary: Colors.red),
            ),
            SizedBox(
              //Use of SizedBox
              height: 30,
            ),
            SizedBox(
                width: 160, // <-- Your width // <-- Your height
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Page3();
                    }));
                  },
                  child: Text('Créer un compte'),
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(), primary: Colors.red),
                )),
            SizedBox(
              //Use of SizedBox
              height: 40,
            ),
            Text(
              "Où se connecter avec",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            /////////////////////////////////

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Image tapped
                InkWell(
                    onTap: () {},
                    child: Image.network(
                      'https://img.icons8.com/3d-fluency/94/null/gmail.png',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    )),
                InkWell(
                    onTap: () {},
                    child: Image.network(
                      'https://img.icons8.com/color/48/null/facebook.png',
                      width: 54,
                      height: 53,
                      fit: BoxFit.cover,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
