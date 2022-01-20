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

class EditProfile extends StatefulWidget {
  final String username, email, about;
  const EditProfile(
      {Key? key,
      required this.username,
      required this.email,
      required this.about})
      : super(key: key);
  @override
  _EditProfilestate createState() => _EditProfilestate();
}

class _EditProfilestate extends State<EditProfile> {
  @override
  String? _email, _about, _username;
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
    _username = widget.username;
    _about = widget.about;
    _email = widget.email;

    Firebase.initializeApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Edit"),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(1000),
                      child: Image.network(
                        userDocument["profile_picture"],
                        scale: 3,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Row(
                      children: [
                     
                        IconButton(
                          icon: ShaderMask(
                            blendMode: BlendMode.srcATop,
                            shaderCallback: (bounds) => const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xfff6072f),
                                  Color(0xfff200a1),
                                ]).createShader(bounds),
                            child: const Icon(
                              Icons.image,
                              color: const Color(0xfff04c4d),
                            ),
                          ),
                          color: Colors.red,
                          onPressed: () {
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ],
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
                  buildTextFieldEmail(),
                  buildTextFieldUsername(),
                  buildTextFieldAbout(),
                ],
              ),
            ),
            const Divider(
              color: Colors.transparent,
            ),
            const Divider(
              color: Colors.transparent,
            ),
            buildButtonEdit(context)
          ],
        );
      },
    );
  }

  Container buildButtonEdit(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {},
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

  Container buildTextFieldUsername() {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(top: 12),
        child: TextFormField(
            initialValue: _username,
            keyboardType: TextInputType.text,
            onChanged: (value) => _username = value.trim(),
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
                  Icons.person,
                  color: const Color(0xfff04c4d),
                ),
              ),
              hintText: 'Username',
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

  Container buildTextFieldAbout() {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(top: 12),
        child: TextFormField(
            initialValue: _about,
            keyboardType: TextInputType.text,
            onChanged: (value) => _about = value.trim(),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(color: Colors.transparent),
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
                  Icons.lock,
                  color: const Color(0xfff04c4d),
                ),
              ),
              hintText: 'About',
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

  Container buildTextFieldEmail() {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(top: 12),
        child: TextFormField(
            initialValue: _email,
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => _email = value.trim(),
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
}
