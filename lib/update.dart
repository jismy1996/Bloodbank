import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

class UpdateDonor extends StatefulWidget {
  const UpdateDonor({Key? key, required Map arguments}) : super(key: key);

  @override
  State<UpdateDonor> createState() => _UpdateDonorState();
}

class _UpdateDonorState extends State<UpdateDonor> {
  
  final bloodgroups = [
    'A+',
    'A',
    'B+',
    'B',
    'AB+',
    'AB-',
    'O+',
    'O-',
    'A-',
    'B-'
  ];
  String? selectedgroup;

  final CollectionReference donor =
      FirebaseFirestore.instance.collection('donor');

      TextEditingController donarName = TextEditingController();
            TextEditingController donarNumber = TextEditingController();



  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map;
    donarName.text = args['name']??"";
    donarNumber.text = args['phone'];
    selectedgroup = args['group'];
    final docId = args['id'];
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Update Doners", 
        style: TextStyle(color: Colors.white),
      )),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: donarName,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("Donar Name")),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: donarNumber,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("Phone Number")),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField(
              decoration: InputDecoration(label: Text("Select blood gropup")),
                items: bloodgroups
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (val) {
                  selectedgroup = val as String?;
                }),
          ),
          ElevatedButton(onPressed: (){
           
          }, child: Text("Update"))
        ],
      ),
    );
  }
}
