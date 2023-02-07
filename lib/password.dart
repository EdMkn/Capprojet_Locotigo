import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'main.dart';
import 'login.dart';
import 'forgotten_password.dart';

class Page6 extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController inputcontroller = TextEditingController();

  bool valide = false;

  void Validate(String email) {
    bool isvalid = EmailValidator.validate(email);
    print(isvalid);
    if (isvalid) {
      valide = true;
    }
  }

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
                          MaterialPageRoute(builder: (context) => Login()),
                        ),
                    child: Image.network(
                      'https://img.icons8.com/ios-filled/50/null/chevron-left.png',
                      width: 12,
                      height: 12,
                      fit: BoxFit.cover,
                    )),
              ],
            ),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: inputcontroller,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  filled: true, //<-- SEE HERE
                  fillColor: Color(0xffffffff),
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                  labelText: 'Email',
                ),
              ),
            ),
            Text(
              "indiquez l’adresse e-mail associée a votre Espace personnel pour recevoir un lien afin de réinitialiser votre mot de passe",
              style: TextStyle(fontSize: 15, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              //Use of SizedBox
              height: 40,
            ),
            SizedBox(
              width: 300,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Validate(inputcontroller.text);
                  if (valide) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Page7();
                    }));
                  }
                },
                child: Text('Envoyé'),
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
