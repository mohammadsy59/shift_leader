import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  String name;
  String ventilation;
  String nutrition;
  String admitionDate;
  Future function;

  CustomListTile({
    required this.name,
    required this.ventilation,
    required this.nutrition,
    required this.admitionDate,
    required this.function
  }
      );
  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        ListTile(
          leading: const Icon(Icons.person),
          title: Text(name),
          subtitle: Text(ventilation),
          trailing: IconButton(onPressed: ()=>function,
              icon: const Icon(Icons.delete_forever),
          color: Colors.red,),
        ),
        
      ],
    );
  }
}
