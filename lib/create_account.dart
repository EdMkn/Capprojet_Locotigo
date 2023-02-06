import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'dart:async';
import 'main.dart';
import 'create_account_next.dart';

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  final _formKey = GlobalKey<FormState>();
  bool valuefirst = false;
  bool valuesecond = false;
  bool isChecked = false;
  final todoController = TextEditingController();

  String username = '';
  String pswd = '';
  String adresse = '';
  String email = '';
  bool checkboxValue = false;

  validationForm() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        debugPrint('$username');
        debugPrint('$pswd');
        debugPrint('$adresse');
        debugPrint('$email');
        debugPrint('$checkboxValue');
        _formKey.currentState!.reset();
        if (checkboxValue)
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return Page4();
          }));
        else {
          saveInscription("test1");
          Navigator.pushNamed(context, '/connexion');
        }
      } else {
        debugPrint('Error...');
      }
    } else {
      debugPrint('impossible');
    }
  }

  Future<void> saveInscription(String title) async {
    final todo = ParseObject('client')
      ..set('username', username)
      ..set('password', pswd)
      ..set('adresse', adresse)
      ..set('email', email)
      ..set('isProd', checkboxValue);
    await todo.save();
  }

  /*void addToDo() async {
    if (todoController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Empty title"),
        duration: Duration(seconds: 2),
      ));
      return;
    }
    await saveTodo(todoController.text);
    setState(() {
      todoController.clear();
    });
  }
  

  Future<List<ParseObject>> getTodo() async {
    await Future.delayed(Duration(seconds: 2), () {});
    return [];
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.alphaBlend(Color(0xffa6ec55), Colors.lightGreenAccent),
      body: Form(
        key: _formKey,
        child: Center(
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
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              //             const Padding(
              //              padding: EdgeInsets.symmetric(horizontal: 8),
              //              child:
              TextFormField(
                decoration: InputDecoration(
                  filled: true, //<-- SEE HERE
                  fillColor: Color(0xffffffff),
                  border: OutlineInputBorder(),
                  hintText: 'Nom utilisateurs',
                ),
                keyboardType: TextInputType.text,
                validator: (val) =>
                    {val ?? ''}.length == 0 ? "Validez votre nom" : null,
                onSaved: (val) => username = val ?? '',
                //onSubmitted: (value) => {},
              ),
//              ),
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
                  hintText: 'Mot de passe',
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
                onSaved: (val) => pswd = val ?? '',
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
                  hintText: 'Entrez le nouveau mot de passe a nouveau',
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
                validator: (val) {
                  //debugPrint(identical(val ?? '', pswd).toString());
                  !identical(val ?? '', pswd)
                      ? "Les mots de passe sont differents"
                      : null;
                },
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
                  hintText: 'Ex:176 Grande rue',
                ),
                keyboardType: TextInputType.text,
                onSaved: (val) => adresse = val ?? '',
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
                  hintText: 'Adresse e-mail',
                ),
                keyboardType: TextInputType.emailAddress,
                autocorrect: true,
                autofocus: true,
                onSaved: (val) => email = val ?? '',
              ),
              SizedBox(
                //Use of SizedBox
                height: 10,
              ),
              /*
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
                ]),
                */
              FormField<bool>(
                builder: (state) {
                  return Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Checkbox(
                              value: checkboxValue,
                              onChanged: (value) {
                                setState(() {
//save checkbox value to variable that store terms and notify form that state changed
                                  checkboxValue = value ?? checkboxValue;
                                  state.didChange(value);
                                });
                              }),
                          Text('Je suis un producteur'),
                        ],
                      ),
//display error in matching theme
                      Text(
                        state.errorText ?? '',
                        style: TextStyle(
                          color: Theme.of(context).errorColor,
                        ),
                      )
                    ],
                  );
                },
//output from validation will be displayed in state.errorText (above)
              ),

              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: validationForm,
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
