import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';

class alat2 extends StatefulWidget {
  alat2({Key? key}) : super(key: key);

  @override
  State<alat2> createState() => _alat2State();
}

class _alat2State extends State<alat2> {
  @override
  Widget alat2({required Map alat_2}) {
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
                      'N: ' + alat_2['N'],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      'P: ' + alat_2['P'],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      'K:  ' + alat_2['K'],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Moist: ' + alat_2['Moist'],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Waktu: ' + alat_2['Waktu'],
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
    DatabaseReference reference = FirebaseDatabase.instance.ref('Alat_Ukur2/');
    Query dbref = reference.limitToLast(10);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Data Alat 2'),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          reverse: false,
          query: dbref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map alat_2 = snapshot.value as Map;
            alat_2['key'] = snapshot.key;

            return alat2(alat_2: alat_2);
          },
        ),
      ),
    );
  }
}
