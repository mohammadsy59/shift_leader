import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shift_leader/gui/add_patients.dart';
import 'package:shift_leader/gui/update_patient.dart';
import 'package:shift_leader/main.dart';
import 'package:flutter/material.dart';
import 'package:shift_leader/models/custom_list_tile.dart';
import 'package:shift_leader/models/patient.dart';


class FirstFragment extends StatefulWidget {
  @override
  State<FirstFragment> createState() => _FirstFragmentState();
}

class _FirstFragmentState extends State<FirstFragment> {
  List<Patient> loadedPatients = [];
  List<ListTile> patientsListTiles = [];
  Stream collectionStream =
      FirebaseFirestore.instance.collection('patients').orderBy('department').snapshots();

  @override
  initState() {
    getDocs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
              child: StreamBuilder(
            stream: collectionStream,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.lightBlue,

                  ),
                );
              }

              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {

                    DocumentSnapshot ds = snapshot.data.docs[index];




                    return Column(

                      children: [

                        Row(
                          children: [
                            Expanded(
                              child: Card(
                                child: ListTile(
                                  title: Row(
                                    children: [
                                      Expanded(child: Text(ds['name'])),
                                      Expanded(child: Text(ds['admitionDate'] )),
                                    IconButton(
                                                 onPressed: () =>  buildShowDialog(context, snapshot, index),
                                                 icon: Icon(Icons.delete)),

                                    ],
                                  ),
                                  subtitle:
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(child: Text(ds['ventilation'])),
                                              Expanded(child: Text(ds['nutrition']),)
                                            ],
                                          )
                                        ],
                                      ),
                                      // Text(ds['ventilation']),
                                  leading: ds['department'] == 'عناية'?Image.asset('lib/assets/icons/icu.png'):Image.asset('lib/assets/icons/ward1.png'),
                                  onLongPress: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateUser(ds)));
                                  }

                                ),
                              ),
                            ),

                          ],
                        ),

                        SizedBox(height: 4,)
                      ],
                    );
                  });
            },
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddUser()));
        },
      ),
    );
  }

   buildShowDialog(BuildContext context, AsyncSnapshot<dynamic> snapshot, int index) async {
    showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('تحذير'),
                                      content: Text('هل تريد حذف المريض ؟'),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              FirebaseFirestore.instance
                                                  .runTransaction((Transaction
                                                      myTransaction) async {
                                                await myTransaction.delete(snapshot
                                                    .data.docs[index].reference);
                                              });
                                              Navigator.pop(context, 'نعم');
                                            },
                                            child: Text('نعم')),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context, 'cancel');
                                          },
                                          child: Text('لا'),
                                        )
                                      ],
                                    );
                                  });
  }

  Future getDocs() async {
    List<Patient> loadedpatients2 = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("patients").get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i];
      // print(a.data());
      var newPatient = Patient(a.get('name'), a.get('nutrition'),
          a.get('ventilation'), a.get('department'));
      loadedpatients2.add(newPatient);
    }
  }



}
