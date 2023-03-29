import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  
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


      void addDonar()
      {
        final data = {"name": donarName.text,"phone":donarNumber.text,"group":selectedgroup};
        donor.add(data);
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Add Doners", 
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
            addDonar();
            Navigator.pop(context);

          }, child: Text("Submit"))
        ],
      ),
    );
  }
}
