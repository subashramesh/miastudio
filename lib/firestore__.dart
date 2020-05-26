import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FIRESTORE{
  static Firestore firestore;
  static initFS(){
    firestore = Firestore.instance;
  }
}