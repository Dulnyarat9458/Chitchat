import 'dart:io';
import 'dart:ui';
import 'package:chitchat/view/Auth/login_page.dart';
import 'package:chitchat/view/Home/optionmenu/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class setting extends StatefulWidget {
  setting({Key? key}) : super(key: key);
  @override
  _settingState createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  String? email;
  final List<String> entries = <String>[
    'A',
    'B',
    'C',
    'B',
    'C',
    'B',
    'C',
    'B',
    'C',
    'B',
    'C',
    'B',
    'C',
    'B',
    'C',
    'B',
    'C',
    'B',
    'C',
    'B',
    'C',
    "END"
  ];

  void initState() {
    Firebase.initializeApp();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Setting",
                    style: GoogleFonts.kanit(fontSize: 24, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),

        /* backgroundColor: Colors.amber, */
      ),
      backgroundColor: Colors.black,
      body: Container(
          margin: const EdgeInsets.all(16), child: showUserProfile(context)),
    );
  }

  StreamBuilder showUserProfile(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    return StreamBuilder(
      stream:
          FirebaseFirestore.instance.collection('users').doc(uid).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData) {
          return const CupertinoActivityIndicator();
        }
        var userDocument = snapshot.data;
        return Column(
          children: [
            Flexible(
                child: ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  Profile()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
           
                     borderRadius: BorderRadius.circular(15.0),
                      color: Colors.transparent,
                    ),
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(bottom: 12),
                    height: 50,
                    child: Text(
                      'Profile',
                      style: GoogleFonts.kanit(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
             
                     borderRadius: BorderRadius.circular(15.0),
                    color: Colors.transparent,
                  ),
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(bottom: 8),
                  height: 50,
                  child: Text(
                    'set Option A',
                    style: GoogleFonts.kanit(fontSize: 16, color: Colors.white),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
               
                   borderRadius: BorderRadius.circular(15.0),
                    color: Colors.transparent,
                  ),
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(bottom: 12),
                  height: 50,
                  child: Text(
                    'set Option A',
                    style: GoogleFonts.kanit(fontSize: 16, color: Colors.white),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
               
                   borderRadius: BorderRadius.circular(15.0),
                    color: Colors.transparent,
                  ),
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(bottom: 12),
                  height: 50,
                  child: Text(
                    'set Option A',
                    style: GoogleFonts.kanit(fontSize: 16, color: Colors.white),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                  
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.transparent,
                  ),
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(bottom: 12),
                  height: 50,
                  child: Text(
                    'set Option A',
                    style: GoogleFonts.kanit(fontSize: 16, color: Colors.white),
                  ),
                ),
                InkWell(
                  onTap: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (builder) => LoginPage()),
                          (route) => false);
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 4,
                        color: Colors.pink,
                      ),
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.transparent,
                    ),
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(bottom: 8, top: 20),
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign Out',
                          style: GoogleFonts.kanit(
                              fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
          ],
        );
      },
    );
  }

  Container buildTextFieldSearch() {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(top: 12),
        child: TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => email = value.trim(),
            decoration: InputDecoration(
              enabledBorder: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              fillColor: const Color(0xff22262f),
              filled: true,
              isDense: true,
              contentPadding: const EdgeInsets.all(18),
              prefixIcon: ShaderMask(
                blendMode: BlendMode.srcATop,
                shaderCallback: (bounds) => const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xfff6072f),
                      Color(0xfff200a1),
                    ]).createShader(bounds),
                child: const Icon(
                  Icons.search,
                  color: const Color(0xfff04c4d),
                ),
              ),
              hintText: 'Search',
              hintStyle: GoogleFonts.kanit(
                fontSize: 16.0,
                color: const Color(0xff6b7992),
              ),
            ),
            style: GoogleFonts.kanit(
              fontSize: 16,
              color: Colors.white,
            )));
  }
}
