import 'package:chitchat/view/Home/addfriend/scan.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class MyQRCode extends StatefulWidget {
  MyQRCode({Key? key}) : super(key: key);
  @override
  _MyQRCodeState createState() => _MyQRCodeState();
}

class _MyQRCodeState extends State<MyQRCode> {
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
        title: const Text("My QR Code"),
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        /* backgroundColor: Colors.amber, */
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            child: Text(
              "Your QR Code",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(8),
                color: Colors.white,
                child: QrImage(
                  data: 'This is a simple QR code',
                  version: QrVersions.auto,
                  size: 320,
                  gapless: false,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Container buildButtonQRCode(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {},
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
        onTap: () {},
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
        onTap: () {},
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
