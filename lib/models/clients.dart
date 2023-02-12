library models;

import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

///Une entite englobant tous les types de clients
class Client {
  String email = '';
  String username = '';
  String password = '';
  String adresse = '';
  String get getEmail => email;

  set setEmail(String email) => this.email = email;

  get getUsername => username;

  set setUsername(username) => this.username = username;

  get getPassword => password;

  set setPassword(password) => this.password = password;

  get getAdresse => adresse;

  set setAdresse(adresse) => this.adresse = adresse;

  Client(this.email, this.username, this.password, this.adresse);
}

/// entité englobant les producteurs parmi les clients
class Producteur extends Client {
  String rsociale = '';
  String jurform = '';
  String siret = '';
  String ape = '';
  String n_tva = '';
  String get getRsociale => rsociale;

  set setRsociale(String rsociale) => this.rsociale = rsociale;

  get getJurform => jurform;

  set setJurform(jurform) => this.jurform = jurform;

  get getSiret => siret;

  set setSiret(siret) => this.siret = siret;

  get getApe => ape;

  set setApe(ape) => this.ape = ape;

  get ntva => n_tva;

  set ntva(value) => n_tva = value;
  Producteur(
      String email,
      String username,
      String password,
      String adresse,
      this.rsociale,
      this.jurform,
      this.siret,
      this.ape,
      this.n_tva)
      : super(email, username, password, adresse);
}

/// entité englobant les consommateurs parmi les clients
class Consommateur extends Client {
  Consommateur(String email, String username, String password, String adresse)
      : super(email, username, password, adresse);
}
