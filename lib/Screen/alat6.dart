import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';

class alat6 extends StatefulWidget {
  alat6({Key? key}) : super(key: key);

  @override
  State<alat6> createState() => _alat6State();
}

class _alat6State extends State<alat6> {
  @override
  //Query dbref = FirebaseDatabase.instance.ref().child('Alat_Ukur6/');
  @override
  Widget alat6({required Map alat_6}) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              //offset: Offset(4, 4),
              spreadRadius: 3,
            ),
          ],
        ),
        child: Row(
          children: [
            // Image.asset('Asset/icon_logo.png'),
            SizedBox(
              width: 10,
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'N: ' + alat_6['n'],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      'P: ' + alat_6['p'],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      'K:  ' + alat_6['k'],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Moist: ' + alat_6['moisture'],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'pH: ' + alat_6['ph'],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Waktu: ' + alat_6['waktu'],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    DatabaseReference reference = FirebaseDatabase.instance.ref('Alat_Ukur3/');
    Query dbref = reference.limitToLast(10);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Data Alat 3'),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: dbref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map alat_6 = snapshot.value as Map;
            alat_6['key'] = snapshot.key;

            return alat6(alat_6: alat_6);
          },
        ),
      ),
    );
  }
}
