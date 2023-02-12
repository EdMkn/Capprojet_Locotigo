library models;
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

///Une entite englobant tous les types de clients
class Client {
  String email = '';
  String username = '';
  String password = '';
  String adresse = '';

   Client( this.email,
  this.username,
  this.password ,
  this.adresse);
}

/// entité englobant les producteurs parmi les clients
class Producteur extends Client{
  String? rsociale='';
  String? jurform = '';
  String siret = '';
  String? activite = '';
  String? ape = '';
  String? n_tva = '';
  Producteur(String email,String username,String password,String adresse,
    this.rsociale,
    this.jurform,
    this.siret,
    this.activite,
    this.ape,
    this.n_tva):super(email,username,password ,adresse);

}
/// entité englobant les consommateurs parmi les clients
class Consommateur extends Client{
Consommateur(String email,String username,String password,String adresse):super(email,username,password ,adresse);
}