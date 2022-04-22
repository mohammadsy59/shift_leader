
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FThirdFragment extends StatefulWidget {
  @override
  State<FThirdFragment> createState() => _FThirdFragmentState();
}

class _FThirdFragmentState extends State<FThirdFragment>  {
  Stream icuStream =  FirebaseFirestore.instance.collection('patients').where('department',isEqualTo : 'عناية')
      .snapshots();
  Stream wardStream = FirebaseFirestore.instance.collection('patients').where('department',isEqualTo : 'جناح')
      .snapshots();
  Stream ventilatorStream = FirebaseFirestore.instance.collection('patients').where('ventilation',isEqualTo : 'منفسة')
      .snapshots();
  Stream maskStream = FirebaseFirestore.instance.collection('patients').where('ventilation',isEqualTo : 'ماسك')
      .snapshots();
  Stream forkStream = FirebaseFirestore.instance.collection('patients').where('ventilation',isEqualTo : 'شوكة')
      .snapshots();
  Stream maskWithBagStream = FirebaseFirestore.instance.collection('patients').where('ventilation',isEqualTo : 'ماسك مع كيس')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: StreamBuilder(

            stream: icuStream,
            builder:  (context, AsyncSnapshot snapshot){
             int icuCount = snapshot.data.docs.length;
              return  ListTile(
                title: Text('مرضى العناية'),
                subtitle: Text(icuCount.toString()),
              );
            },

          ),
        ),

      ],
    );
  }
}