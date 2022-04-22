
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SecondFragment extends StatelessWidget {
  Stream liquidStream = FirebaseFirestore.instance.collection('patients').where('nutrition',isEqualTo : 'سوائل')
      .snapshots();
  Stream solidStream = FirebaseFirestore.instance.collection('patients').where('nutrition',isEqualTo : 'وجبة')
      .snapshots();
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
  Stream cpapStream = FirebaseFirestore.instance.collection('patients').where('ventilation',isEqualTo : 'cpap')
      .snapshots();





  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return 
       
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: StreamBuilder(stream: icuStream,
                  builder: (context ,  AsyncSnapshot snapshot){
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: ListTile(
                                leading: Image.asset('lib/assets/icons/icu.png'),
                                title: const Text('مرضى العناية'),
                                subtitle: Text(snapshot.data.docs.length.toString()),
                              ),
                            )
                          ],
                        ),


                      ],
                    );
                  }
                    ),
                ),
                Expanded(
                  child: StreamBuilder(stream: wardStream,
                      builder: (context ,  AsyncSnapshot snapshot){
                        if (snapshot.hasError) {
                          return Text('Something went wrong');
                        }
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Text("Loading");
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: ListTile(
                                    leading: Image.asset('lib/assets/icons/ward1.png'),
                                    title: const Text('مرضى الجناح'),
                                    subtitle: Text(snapshot.data.docs.length.toString()),
                                  ),
                                )
                              ],
                            ),

                          ],
                        );
                      }
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: StreamBuilder(stream: liquidStream,
                      builder: (context ,  AsyncSnapshot snapshot){
                        if (snapshot.hasError) {
                          return Text('Something went wrong');
                        }
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Text("Loading");
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: ListTile(
                                    leading: Image.asset('lib/assets/icons/drink.png'),
                                    title: Text('سوائل'),
                                    subtitle: Text(snapshot.data.docs.length.toString()),
                                  ),
                                )
                              ],
                            ),


                          ],
                        );
                      }
                  ),
                ),
                Expanded(
                  child: StreamBuilder(stream: solidStream,
                      builder: (context ,  AsyncSnapshot snapshot){
                        if (snapshot.hasError) {
                          return Text('Something went wrong');
                        }
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Text("Loading");
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: ListTile(
                                    leading: Image.asset('lib/assets/icons/food.png'),
                                    title: Text('وجبات'),
                                    subtitle: Text(snapshot.data.docs.length.toString()),
                                  ),
                                )
                              ],
                            ),

                          ],
                        );
                      }
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: StreamBuilder(stream: forkStream,
                      builder: (context ,  AsyncSnapshot snapshot){
                        if (snapshot.hasError) {
                          return Text('Something went wrong');
                        }
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Text("Loading");
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: ListTile(
                                    leading: Image.asset('lib/assets/icons/oxygen-mask.png'),
                                    title: const Text('المرضى على شوكة أنفية'),
                                    subtitle: Text(snapshot.data.docs.length.toString()),
                                  ),
                                )
                              ],
                            ),


                          ],
                        );
                      }
                  ),
                ),
                Expanded(
                  child: StreamBuilder(stream: ventilatorStream,
                      builder: (context ,  AsyncSnapshot snapshot){
                        if (snapshot.hasError) {
                          return Text('Something went wrong');
                        }
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Text("Loading");
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: ListTile(
                                    leading: Image.asset('lib/assets/icons/respirator.png'),
                                    title: const Text('المرضى على المنفسة'),
                                    subtitle: Text(snapshot.data.docs.length.toString()),
                                  ),
                                )
                              ],
                            ),

                          ],
                        );
                      }
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: StreamBuilder(stream: maskWithBagStream,
                      builder: (context ,  AsyncSnapshot snapshot){
                        if (snapshot.hasError) {
                          return Text('Something went wrong');
                        }
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Text("Loading");
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: ListTile(
                                    leading:  Image.asset('lib/assets/icons/oxygen-mask.png'),
                                    title: const Text('المرضى على قناع مع كيس'),
                                    subtitle: Text(snapshot.data.docs.length.toString()),
                                  ),
                                )
                              ],
                            ),


                          ],
                        );
                      }
                  ),
                ),
                Expanded(
                  child: StreamBuilder(stream: cpapStream,
                      builder: (context ,  AsyncSnapshot snapshot){
                        if (snapshot.hasError) {
                          return Text('Something went wrong');
                        }
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Text("Loading");
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: ListTile(
                                    leading: Image.asset('lib/assets/icons/respirator.png'),
                                    title: const Text('المرضى على CPAP'),
                                    subtitle: Text(snapshot.data.docs.length.toString()),
                                  ),
                                )
                              ],
                            ),

                          ],
                        );
                      }
                  ),
                ),
              ],
            ),




          ],
        );
    
  }

}