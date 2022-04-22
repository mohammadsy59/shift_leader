import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shift_leader/fragments/first_fragment.dart';
import 'package:shift_leader/fragments/second_fragment.dart';


class DrawerItem{
  late String title;
  late IconData icon;
  DrawerItem(this.title,this.icon);
}
class MainPage extends StatefulWidget{
  final drawerItems = [
     DrawerItem('أسماء المرضى', Icons.person),
     DrawerItem('احصائيات',Icons.print),
     // DrawerItem('احصائيات', Icons.wifi_tethering_outlined),

  ];
  @override
  State<StatefulWidget> createState(){
    return  MainPageState();
  }
}
class MainPageState extends State<MainPage>{
  getPatientsList() async {
var   snapshots = await FirebaseFirestore.instance.collection('patients').snapshots();
    return snapshots;
  }

  late QuerySnapshot querySnapshot;
  int _selectedDrawerIndex = 0;
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return  FirstFragment();
      case 1:
        return  SecondFragment();


      default:
        return new Text("Error");
    }
  }
  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }
  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
           ListTile(
            leading:  Icon(d.icon),
            title:  Text(d.title),
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectItem(i),
          )
      );
    }
    return  Scaffold(
      appBar:  AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title:  Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer:  Drawer(
        child:  Column(
          children: <Widget>[
              UserAccountsDrawerHeader(
                accountName:  Text("مشفى سلقين التخصصي للعزل"), accountEmail: null),
             Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),


    );
  }
}

