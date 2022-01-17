import 'dart:io';
import 'dart:ui';
import 'package:chitchat/view/Home/addfriend/addmenu.dart';
import 'package:chitchat/view/Home/optionmenu/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class friendList extends StatefulWidget {
  friendList({Key? key}) : super(key: key);
  @override
  _friendListState createState() => _friendListState();
}

class _friendListState extends State<friendList> {
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
      appBar: AppBar(automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    child: showUserImg(context),
                    margin: EdgeInsets.only(right: 16),
                  ),
                  Text(
                    "Friend",
                    style: GoogleFonts.kanit(fontSize: 24, color: Colors.white),
                  ),
                ],
              ),
              ShaderMask(
                  blendMode: BlendMode.srcATop,
                  shaderCallback: (bounds) => const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xfff6072f),
                            Color(0xfff200a1),
                          ]).createShader(bounds),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  AddMenu()));
                    },
                    icon: Icon(
                      Icons.person_add,
                      color: const Color(0xff7ca8ff),
                    ),
                  )),
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
          return Center(child: const CupertinoActivityIndicator());
        }
        var userDocument = snapshot.data;
        return Column(
          children: [
            buildTextFieldSearch(),
            Flexible(
              child: ListView.builder(
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      // ignore: prefer_const_constructors
                      padding: EdgeInsets.only(
                        top: 16,
                        left: 8,
                        right: 8,
                        bottom: 8,
                      ),

                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1000),
                            ),
                            width: 50,
                            height: 50,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(1000),
                              child: Image.network(
                                userDocument["profile_picture"],
                                scale: 3,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "lorem lorem" + entries[index],
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                Text(
                                  "xxxxxxxxxxx" + entries[index],
                                  style: const TextStyle(
                                      color: Colors.white70, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        );
      },
    );
  }

  StreamBuilder showUserImg(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    return StreamBuilder(
      stream:
          FirebaseFirestore.instance.collection('users').doc(uid).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData) {
          return const CupertinoActivityIndicator();
        }
        var userDocument = snapshot.data;
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Profile(),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(1000),
            child: Image.network(
              userDocument["profile_picture"],
              scale: 3,
              fit: BoxFit.fill,
            ),
          ),
        );
      },
    );
  }

  StreamBuilder showUsername(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    return StreamBuilder(
      stream:
          FirebaseFirestore.instance.collection('users').doc(uid).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData) {
          return const CupertinoActivityIndicator();
        }
        var userDocument = snapshot.data;
        return Text(userDocument["username"],
            style: GoogleFonts.kanit(fontSize: 24, color: Colors.white));
      },
    );
  }

  Container buildTextFieldSearch() {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(bottom: 16),
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
