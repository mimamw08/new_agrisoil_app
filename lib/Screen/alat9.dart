import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';

class alat9 extends StatefulWidget {
  alat9({Key? key}) : super(key: key);

  @override
  State<alat9> createState() => _alat9State();
}

class _alat9State extends State<alat9> {
  @override

  //Query dbref = FirebaseDatabase.instance.ref().child('Alat_Ukur9/');
  @override
  Widget alat9({required Map alat_9}) {
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
                      'N: ' + alat_9['n'],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      'P: ' + alat_9['p'],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      'K:  ' + alat_9['k'],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      'pH:  ' + alat_9['ph'],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Moist: ' + alat_9['moisture'],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Waktu: ' + alat_9['waktu'],
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
    DatabaseReference reference = FirebaseDatabase.instance.ref('Alat_Ukur5/');
    Query dbref = reference.limitToLast(10);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Data Alat 5'),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          reverse: false,
          query: dbref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map alat_9 = snapshot.value as Map;
            alat_9['key'] = snapshot.key;

            return alat9(alat_9: alat_9);
          },
        ),
      ),
    );
  }
}
