import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateUser extends StatefulWidget {
  DocumentSnapshot ds ;
  UpdateUser(this.ds);
  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  late DocumentSnapshot ds =widget.ds;
  var ventItems = ['Cpap', 'منفسة', 'شوكة', 'ماسك', 'ماسك مع كيس'];
  var nutritionItmes = ['سوائل', 'وجبة'];
  var depItems = ['عناية', 'جناح'];
  late String depDropDownValue = ds['department'];
  late String ventDropDownValue = ds['ventilation'];
  late String nutDropDownValue = ds['nutrition'];
  var patientNameController = TextEditingController();
  var patientAdmitionDateController = TextEditingController();


  @override
  Widget build(BuildContext context) {
patientNameController.text = ds['name'];
patientAdmitionDateController.text = ds['admitionDate'];

    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 50),
        child: Center(
          child: Column(
            children: [

              DropdownButton<String>(
                  isExpanded: true,
                  value: depDropDownValue,
                  icon: Icon(Icons.arrow_drop_down),
                  items:depItems
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      depDropDownValue = newValue!;
                    });
                  }),
              const SizedBox(
                height: 20,
              ),
              DropdownButton<String>(
                  isExpanded: true,
                  value: ventDropDownValue,
                  icon: Icon(Icons.arrow_drop_down),
                  items: ventItems
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
              const SizedBox(
                height: 20,
              ),
              DropdownButton<String>(
                  isExpanded: true,
                  value: nutDropDownValue,
                  icon: Icon(Icons.arrow_drop_down),
                  items: nutritionItmes
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
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: patientNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'اسم المريض',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: patientAdmitionDateController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'تاريخ القبول',
                ),
              ),
              TextButton(
                  child: Text('تعديل مريض'),
                  onPressed: () async{
                    CollectionReference users = FirebaseFirestore.instance.collection('patients');
                    await  ds.reference.update(
                        {
                          'department': depDropDownValue,
                          'ventilation': ventDropDownValue,
                          'name': patientNameController
                              .text,
                          'nutrition': nutDropDownValue,
                          'admitionDate': patientAdmitionDateController
                              .text
                        });
                    Navigator.pop(context);
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }





}