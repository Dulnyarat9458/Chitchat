import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Firebase.initializeApp();
    //senderFunction();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "โปรไฟล์",
          style: GoogleFonts.kanit(),
        ),
      ),
      body: Container(
          margin: EdgeInsets.all(4),
          padding: EdgeInsets.all(8),
          child: showUserProfile(context)),
    );
  }

  StreamBuilder showUserProfile(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    return StreamBuilder(
      stream:
          FirebaseFirestore.instance.collection('users').doc(uid).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        var userDocument = snapshot.data;
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(userDocument["username"]),
              Text(userDocument["email"]),
              Text(userDocument["userid"]),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                    color: Colors.black12.withOpacity(0.1),
                  ),
                  borderRadius: BorderRadius.circular(1000),
                ),
                margin: EdgeInsets.only(bottom: 16),
                width: 175,
                height: 175,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(1000),
                  child: Container(
                    child: Image.network(
                      userDocument["profile_picture"],
                      scale: 3,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
