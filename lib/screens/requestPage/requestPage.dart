import 'package:bank/screens/homepage/homepage.dart';
import 'package:bank/shared/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RequestPage extends StatefulWidget {
  final String uid;
  RequestPage({this.uid});
  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  String requestedBloodGroup = "OP";
  final Firestore _db = Firestore.instance;
  List<DropdownMenuItem> getDropDownItems() {
    List<DropdownMenuItem> dropdownitems = [];

    for (int i = 0; i < bloodgroups.length; i++) {
      var newItem = DropdownMenuItem(
          child: Text(bloodgroups[i]), value: bloodgroupsForDatabase[i]);
      dropdownitems.add(newItem);
    }
    return dropdownitems;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 100,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Color(0xFF2D78FF), width: 2)),
      child: Container(
        height: 200,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Request Blood",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButtonFormField(
                value: requestedBloodGroup,
                decoration: loginFormDecoration.copyWith(
                    // contentPadding: EdgeInsets.all(10),
                    labelText: "Choose Your Blood group",
                    prefixIcon: Icon(Icons.watch_later)),
                items: getDropDownItems(),
                onChanged: (value) {
                  setState(
                    () {
                      requestedBloodGroup = value;
                    },
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Color(0xFFF44336),
                    ),
                    onPressed: () {
                      print(widget.uid);
                      _db
                          .collection("alertCollection")
                          .document(widget.uid)
                          .collection("alerts")
                          .document()
                          .setData({"bloodGroup": requestedBloodGroup});
                      Navigator.pop(context);
                    }),
                SizedBox(
                  width: 10,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
