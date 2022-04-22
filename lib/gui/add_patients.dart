import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  var ventItems = ['Cpap', 'منفسة', 'شوكة', 'ماسك', 'ماسك مع كيس'];
  var nutritionItmes = ['سوائل', 'وجبة'];
  var depItems = ['عناية', 'جناح'];
  String depDropDownValue = 'عناية';
  String ventDropDownValue = 'شوكة';
  String nutDropDownValue = 'وجبة';

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    var patientNameController = TextEditingController();
    var patientAdmitionDateController = TextEditingController();


    void addPatient() {
      FirebaseFirestore.instance.collection('patients').add({
        'department': depDropDownValue,
        'ventilation': ventDropDownValue,
        'name': patientNameController.text,
        'nutrition': nutDropDownValue,
        'admitionDate': patientAdmitionDateController.text
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('اضافة مريض '),
      ),
      body: Center(
        child: Column(
          children: [


            SizedBox(
              height: 10.0,
            ),
            DropdownButton<String>(
              isExpanded: true,
                value: depDropDownValue,
                icon: Icon(Icons.arrow_drop_down),
                items: <String>['عناية', 'جناح']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                    textAlign: TextAlign.center,),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    depDropDownValue = newValue!;
                  });
                }),
            DropdownButton<String>(
              isExpanded: true,
                value: ventDropDownValue,
                icon: Icon(Icons.arrow_drop_down),
                items: <String>['Cpap', 'منفسة', 'شوكة', 'ماسك', 'ماسك مع كيس']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    ventDropDownValue = newValue!;
                  });
                }),
            DropdownButton<String>(
              isExpanded: true,
                value: nutDropDownValue,
                icon: Icon(Icons.arrow_drop_down),
                items: <String>['سوائل', 'وجبة']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {

                    nutDropDownValue = newValue!;
                  });
                }),
            TextField(
              controller: patientNameController,

              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'اسم المريض',
              ),
            ),
            TextField(
              controller: patientAdmitionDateController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'تاريخ القبول',
              ),
            ),
            TextButton(
              onPressed: () {
                addPatient();
                Navigator.pop(context);
              },
              child: Text('اضافة مريض'),
            ),
          ],
        ),
      ),
    );
  }
}
