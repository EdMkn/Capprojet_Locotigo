import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'dart:async';
import 'main.dart';
import 'create_account.dart';
import 'password.dart';

/// Page dédiée à la connexion
class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

 ///Permet de vérifier si le client est dans la base de données
  validationForm() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        debugPrint('$email');
        debugPrint('$password');
        _formKey.currentState!.reset();
        ParseObject match = getId(email);
        if ((identical(match.get<String>('email'), email)) &&
            (identical(match.get<String>('password'), password))) {
          //Navigator.pushed..
          debugPrint('ok');
        } else {
          debugPrint('not ok');
        }
      } else {
        debugPrint('Error...');
      }
    } else {
      debugPrint('impossible');
    }
  }

  /// Permet de vérifier si l'email se trouve dans la bdd
  dynamic getId(String email) async {
    QueryBuilder<ParseObject> queryClient =
        QueryBuilder<ParseObject>(ParseObject('client'))
          ..whereEqualTo('email', email);
    final ParseResponse parseResponse = await queryClient.query();

    if (parseResponse.success && parseResponse.results != null) {
      final object = (parseResponse.results!.first) as ParseObject;
      //debugPrint(object.toString());
      return object;
    } else
      return 'null';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.alphaBlend(const Color(0xffa6ec55), Colors.lightGreenAccent),
      body: Form(
        key: _formKey,
        child: Center(
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
              /* const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16), child:*/
              TextFormField(
                decoration: InputDecoration(
                  filled: true, //<-- SEE HERE
                  fillColor: Color(0xffffffff),
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                  labelText: 'Email',
                ),
                onSaved: (value) => email = value ?? '',
                validator: (value) =>
                    {value ?? ''}.length == 0 ? "Validez votre email" : null,
              ),
              //),
              const SizedBox(
                //Use of SizedBox
                height: 25,
              ),
              TextFormField(
                decoration: InputDecoration(
                  filled: true, //<-- SEE HERE
                  fillColor: Color(0xffffffff),
                  border: OutlineInputBorder(),
                  hintText: 'Mot de passe',
                  labelText: 'Mot de passe',
                ),
                obscureText: true,
                onSaved: (value) => password = value ?? '',
                validator: (value) => {value ?? ''}.length == 0
                    ? "Validez votre mot de passe"
                    : null,
              ),
              const SizedBox(
                //Use of SizedBox
                height: 35,
              ),
              ElevatedButton(
                onPressed: validationForm,
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
                  Navigator.pushNamed(context, '/passeport');
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
      ),
    );
  }
}
