import 'package:chitchat/view/Home/addfriend/invite.dart';
import 'package:chitchat/view/Home/addfriend/myqrcode.dart';
import 'package:chitchat/view/Home/addfriend/scan.dart';
import 'package:chitchat/view/Home/addfriend/searchuser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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

  @override
  void initState() {
    Firebase.initializeApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Profile"),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(1000),
                  child: Image.network(
                    userDocument["profile_picture"],
                    scale: 3,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.transparent,
            ),
            Divider(
              color: Colors.transparent,
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Email: ",
                        style: GoogleFonts.kanit(
                            color: Colors.white, fontSize: 18),
                      ),Text(
                        userDocument["email"],
                        style: GoogleFonts.kanit(
                            color: Colors.white70, fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Username: ",
                        style: GoogleFonts.kanit(
                            color: Colors.white, fontSize: 18),
                      ),Text(
                        userDocument["username"],
                        style: GoogleFonts.kanit(
                            color: Colors.white70, fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "About: ",
                        style: GoogleFonts.kanit(
                            color: Colors.white, fontSize: 18),
                      ), Text(
                        userDocument["about"],
                        style: GoogleFonts.kanit(
                            color: Colors.white70, fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.transparent,
            ),
            Divider(
              color: Colors.transparent,
            ),
            buildButtonEdit( context)
          ],
        );
      },
    );
  }
  Container buildButtonEdit(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          
        },
        child: Container(
            constraints: BoxConstraints.expand(width: 300, height: 50),
            child: Text(
              "Edit",
              textAlign: TextAlign.center,
              style: GoogleFonts.kanit(
                fontSize: 18,
                color: Colors.white,
                /*     shadows: [
                  Shadow(
                    color: Colors.black,
                    blurRadius: 16.0,
                    offset: Offset(-0.0, 0.0),
                  ),
                ], */
              ),
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: 3,
                color: Colors.black12.withOpacity(0.2),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              gradient: const LinearGradient(
                colors: [
                  Color(0xfff6072f),
                  Color(0xfff200a1),
                ],
              ),
            ),
            padding: const EdgeInsets.all(8)),
      ),
    );
  }
  Container buildButtonQRCode(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyQRCode()));
        },
        child: Container(
            constraints: const BoxConstraints.expand(width: 150, height: 150),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  CupertinoIcons.qrcode,
                  size: 75,
                  color: Colors.black,
                ),
                Text(
                  "QRCode",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kanit(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              gradient: LinearGradient(
                colors: [
                  Color(0xfff6072f),
                  Color(0xfff200a1),
                ],
              ),
            ),
            padding: const EdgeInsets.all(8)),
      ),
    );
  }

  Container buildButtonScan(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const QRScan()));
        },
        child: Container(
            constraints: const BoxConstraints.expand(width: 150, height: 150),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  CupertinoIcons.qrcode_viewfinder,
                  size: 75,
                  color: Colors.white,
                ),
                Text(
                  "Scan",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kanit(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              gradient: LinearGradient(
                colors: [
                  Color(0xff22262f),
                  Color(0xff22262f),
                ],
              ),
            ),
            padding: const EdgeInsets.all(8)),
      ),
    );
  }

  Container buildButtonSearch(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchUser(),
            ),
          );
        },
        child: Container(
            constraints: const BoxConstraints.expand(width: 150, height: 150),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  CupertinoIcons.search,
                  size: 75,
                  color: Colors.white,
                ),
                Text(
                  "Search",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kanit(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              gradient: LinearGradient(
                colors: [
                  Color(0xff22262f),
                  Color(0xff22262f),
                ],
              ),
            ),
            padding: const EdgeInsets.all(8)),
      ),
    );
  }

  Container buildButtonInvite(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InviteUser(),
            ),
          );
        },
        child: Container(
            constraints: const BoxConstraints.expand(width: 150, height: 150),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  CupertinoIcons.person_add,
                  size: 75,
                  color: Colors.black,
                ),
                Text(
                  "Invite",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kanit(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              gradient: LinearGradient(
                colors: [
                  Color(0xfff6072f),
                  Color(0xfff200a1),
                ],
              ),
            ),
            padding: const EdgeInsets.all(8)),
      ),
    );
  }
}
