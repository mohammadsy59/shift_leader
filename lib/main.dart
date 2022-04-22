import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shift_leader/fragments/first_fragment.dart';
import 'package:shift_leader/gui/main_screen.dart';
import 'package:shift_leader/gui/welcome_screen.dart';
import 'models/patient.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var status = false;
  status = prefs.getBool('isLoggedIn') ?? false;
  var defHome = status ? MainPage() : WelcomeScreen();
   List<Patient> loadedPatients = [];
   List<ListTile> patientsListTiles = [];
  Future getDocs() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("patients").get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i];

      var newPatient = Patient(a.get('name'),a.get('nutrition'),a.get('ventilation'),a.get('department'));
      loadedPatients.add(newPatient);
      patientsListTiles.add(ListTile(
        title: Text(newPatient.name),
        subtitle: Text(newPatient.ventilation),
      ));

    }
  }
  getDocs();

  runApp( MyApp(defaultHome:defHome ,));
}
class MyApp extends StatefulWidget {
  final Widget defaultHome;
  const MyApp({
    required this.defaultHome,
  });
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context){
    return  MaterialApp(
      title: 'Shift Leader',
      home: widget.defaultHome
);
    }
}




