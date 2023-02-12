import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:helloworld/models/clients.dart';
import 'dart:async';
import 'login.dart';
import 'main.dart';
import 'create_account_next.dart';

/// Page de creation de compte client
class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}


/// Controle de creation de compte client
class _Page3State extends State<Page3> {
  /// cle de formulaire
  final _formKey = GlobalKey<FormState>();
  bool valuefirst = false;
  bool valuesecond = false;
  bool isChecked = false;
  //Trigger for generating the hash code for the entered password
  bool password_hash_trigger = false;


  Consommateur nclient  = Consommateur('', '', '', '');
  String username = '';
  String pswd = '';
  String adresse = '';
  String email = '';
  /// Verifie si l'utilisateur est client ou producteur
  bool checkboxValue = true;

  final _storage = new FlutterSecureStorage();
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();


  ///Permet d'envoyer le client dans la base de données
  validationForm() {
    //si [_formkey] est non nul
    if (_formKey.currentState != null) {
      //si formkey est validé
      if (_formKey.currentState!.validate()) {
        
      /*setState(() {
                password_hash_trigger = true;
              });*/
        _formKey.currentState!.save();

        debugPrint(nclient.username);
        debugPrint(nclient.password);
        debugPrint(nclient.adresse);
        debugPrint(nclient.email);
        debugPrint('$checkboxValue');

       // await _storage.write(key: "KEY USERNAME", value: _usernamecontroller.text);
        //await _storage.write(key: "KEY_PASSWORD", value: _passwordcontroller.text);
        _formKey.currentState!.reset();
        
        if (checkboxValue) {
          Producteur nprod =  Producteur(nclient.email, nclient.username, nclient.password, nclient.adresse, '', '', '','','','');
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return Page4(nprod);
          }));
        } else {
          saveInscription("test1");
          Navigator.pushNamed(context, '/confirmation');
        }
      } else {
        debugPrint('Error...');
      }
    } else {
      debugPrint('impossible');
    }
  }

  ///Enregistre le compte créé dans la bdd
  Future<void> saveInscription(String title) async {
    final todo = ParseObject('client')
      ..set('username', nclient.username)
      ..set('password', nclient.password)
      ..set('adresse', nclient.adresse)
      ..set('email', nclient.email)
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
                controller: _usernamecontroller,
                validator: (val) =>
                    {val ?? ''}.length == 0 ? "Validez votre nom" : null,
                onSaved: (val) => nclient.username = val ?? '',
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
                controller: _passwordcontroller,
                obscureText: true,
                onSaved: (val) => nclient.password = val ?? '',
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
                //controller: _controller,
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
                onSaved: (val) => nclient.adresse = val ?? '',
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
                validator: (val) =>
                    EmailValidator.validate(val ?? '', true, true)
                        ? null
                        : "Erreur dans l'email",
                onSaved: (val) => nclient.email = val ?? '',
              ),
              SizedBox(
                //Use of SizedBox
                height: 10,
              ),
              Center(
                child: Row(
                  children: [
                    Text(
                      "êtes-vous un producteur ?",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ToggleSwitch(
                      initialLabelIndex: 0,
                      totalSwitches: 2,
                      labels: [
                        'Yes',
                        'No',
                      ],
                      onToggle: (index) {
                        print('switched to: $index');
                        if (index == 0)
                          checkboxValue = true;
                        else if (index == 1) checkboxValue = false;
                      },
                    ),
                  ],
                ),
              ),
              /*FormField<bool>(
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
              ),*/
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
