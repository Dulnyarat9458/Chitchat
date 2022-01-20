
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class InviteUser extends StatefulWidget {
  InviteUser({Key? key}) : super(key: key);
  @override
  _InviteUserState createState() => _InviteUserState();
}

class _InviteUserState extends State<InviteUser> {
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
        title: const Text("Invite"),
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        /* backgroundColor: Colors.amber, */
      ),
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Text(
                    "Enter Email",
                    style: GoogleFonts.kanit(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            buildTextFieldEmail(),
            buildButtonSearch(context),
          ],
        ),
      ),
    );
  }

  Container buildTextFieldEmail() {
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
              contentPadding: EdgeInsets.all(18),
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
                  Icons.email,
                  color: const Color(0xfff04c4d),
                ),
              ),
              hintText: 'Email',
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

  Container buildButtonSearch(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {},
        child: Container(
            constraints: BoxConstraints.expand(width: 300, height: 50),
            child: Text(
              "Search",
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
}
