import 'package:flutter/material.dart';
import 'package:helloworld/create_account.dart';
import 'package:helloworld/login.dart';
import 'package:helloworld/models/clients.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'dart:async';
import 'main.dart';
import 'Confirmation.dart';

late Producteur nprod;

/// Classe de création de compte producteur
class Page4 extends StatefulWidget {
  Page4(lnprod, {Key? key}) : super(key: key) {
    nprod = lnprod;
  }
  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  final _formKey = GlobalKey<FormState>();

  validationForm() {
    //si [_formkey] est non nul
    if (_formKey.currentState != null) {
      //si formkey est validé
      if (_formKey.currentState!.validate()) {
        
      /*setState(() {
                password_hash_trigger = true;
              });*/
        _formKey.currentState!.save();

        debugPrint(nprod.toString());
        _formKey.currentState!.reset();
        
        saveInscription("test1");
        Navigator.pushNamed(context, '/confirmation');
      } else {
        debugPrint('Error...');
      }
    } else {
      debugPrint('impossible');
    }
  }


  ///Enregistre le compte créé dans la bdd
  Future<void> saveInscription(String title) async {
    final todo = ParseObject('producteurs')
      ..set('username', nprod.username)
      ..set('password', nprod.password)
      ..set('adresse', nprod.adresse)
      ..set('email', nprod.email)
      ..set('raison sociale', nprod.rsociale)
      ..set('forme juridique', nprod.jurform)
      ..set('activite', nprod.activite)
      ..set('ape', nprod.ape)
      ..set('num tva', nprod.n_tva);
    await todo.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.alphaBlend(Color(0xffa6ec55), Colors.lightGreenAccent),
      body: Form(
        child: Center(
          key: _formKey,
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
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(
                  filled: true, //<-- SEE HERE
                  fillColor: Color(0xffffffff),
                  border: OutlineInputBorder(),
                  hintText: 'Texte',
                ),
                keyboardType: TextInputType.text,
                validator: (val) =>
                    {val ?? ''}.length == 0 ? "Validez votre raison sociale" : null,
                onSaved: (val) => nprod.rsociale = val ?? '',
                
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
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              TextFormField(
                  decoration: InputDecoration(
                    filled: true, //<-- SEE HERE
                    fillColor: Color(0xffffffff),
                    border: OutlineInputBorder(),
                    hintText: 'EIRL',
                  ),
                  keyboardType: TextInputType.text,
                  validator: (val) =>
                    {val ?? ''}.length == 0 ? "Validez votre forme juridique" : null,
                onSaved: (val) => nprod.jurform = val ?? '',
                
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
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              TextFormField(
                  decoration: InputDecoration(
                    filled: true, //<-- SEE HERE
                    fillColor: Color(0xffffffff),
                    border: OutlineInputBorder(),
                    hintText: 'Numero 13 chiffres',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (val) =>
                    {val ?? ''}.length != 13 ? "Validez votre Siret" : null,
                onSaved: (val) => nprod.siret = val ?? '',
                
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
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              TextFormField(
                  decoration: InputDecoration(
                    filled: true, //<-- SEE HERE
                    fillColor: Color(0xffffffff),
                    border: OutlineInputBorder(),
                    hintText: 'Code APE /NAP',
                  ),
                  keyboardType: TextInputType.text,
                  validator: (val) =>
                    {val ?? ''}.length == 0 ? "Validez votre ape" : null,
                onSaved: (val) => nprod.ape = val ?? '',
                
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
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              TextFormField(
                  decoration: InputDecoration(
                    filled: true, //<-- SEE HERE
                    fillColor: Color(0xffffffff),
                    border: OutlineInputBorder(),
                    hintText: 'Ex: 12  3435 45 3 5 3 45',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (val) =>
                    {val ?? ''}.length == 0 ? "Validez votre nom" : null,
                onSaved: (val) => nprod.n_tva = val ?? '',
                
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
      ),
    );
  }
}
