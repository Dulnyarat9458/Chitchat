
import 'package:chitchat/Controller/dialog.dart';
import 'package:chitchat/view/Home/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:chitchat/Controller/gradient_icon.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late String email, password, repassword, username;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      /*   debugShowCheckedModeBanner: false, */

      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (bounds) => const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xfff6072f),
                  Color(0xfff200a1),
                ]).createShader(bounds),
            child: IconButton(
              icon: Icon(CupertinoIcons.back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          automaticallyImplyLeading: true,
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          /* backgroundColor: Colors.amber, */
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(12),
                      child: Column(children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                            bottom: 8,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Sign Up",
                                style: GoogleFonts.kanit(
                                    color: Colors.white,
                                    fontSize: 36,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Container(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              children: [
                                buildTextFieldUsername(),
                                buildTextFieldEmail(),
                                buildTextFieldPassword(),
                                buildTextFieldRePassword(),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.transparent,
                        ),
                        buildButtonSignUp(context),
                        Divider(
                          color: Colors.transparent,
                        ),
                        Center(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                              buildSignupButton(context),
                            ])),
                      ]),
                    ),
                    Divider(
                      color: Colors.transparent,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  Container buildSignupButton(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          'Already have an Account',
          style: GoogleFonts.kanit(
            color: const Color(0xfff200a1),
          ),
        ),
      ),
    );
  }

  Container buildButtonSignUp(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          createAccountAndInsertInformation();
        },
        child: Container(
            constraints: BoxConstraints.expand(width: 290, height: 50),
            child: Text(
              "Sign Up",
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

  Container buildTextFieldUsername() {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(top: 12),
        child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please fill Username.';
              } else
                return null;
            },
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => username = value.trim(),
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
                  color: const Color(0xff7ca8ff),
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

  Container buildTextFieldEmail() {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(top: 12),
        child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please fill Email.';
              } else
                return null;
            },
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
                  color: const Color(0xff7ca8ff),
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

  Container buildTextFieldPassword() {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(top: 16),
        child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please fill Password.';
              } else
                return null;
            },
            keyboardType: TextInputType.visiblePassword,
            onChanged: (value) => password = value.trim(),
            obscureText: true,
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
                  Icons.lock,
                  color: const Color(0xff7ca8ff),
                ),
              ),
              hintText: 'Password',
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

  Container buildTextFieldRePassword() {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(top: 16),
        child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please fill Confirm Password.';
              } else if (value != password) {
                return 'Please check your Password';
              } else
                return null;
            },
            keyboardType: TextInputType.visiblePassword,
            onChanged: (value) => repassword = value.trim(),
            obscureText: true,
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
                  Icons.refresh,
                  color: const Color(0xff7ca8ff),
                ),
              ),
              hintText: 'Confirm Password',
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

  Future<Null> createAccountAndInsertInformation() async {
    if (_formKey.currentState!.validate()) {
      await Firebase.initializeApp().then((value) async {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) async {
          print('Create Account Success');

          await value.user!.updateDisplayName(username).then((value2) async {
            String uid = value.user!.uid;
            print('Update Profile Success and uid = $uid');

            await FirebaseFirestore.instance.collection('users').doc(uid).set({
              "userid": uid,
              "username": username,
              "email": email,
              "about": "",
              "profile_picture":
                  "https://firebasestorage.googleapis.com/v0/b/chitchat-a40ab.appspot.com/o/profile_picture%2Fdefault.png?alt=media&token=110bfa3c-200c-48c1-a3df-747b28b4a5c3"
            }).then((value) {
              FirebaseAuth.instance
                  .signInWithEmailAndPassword(email: email, password: password)
                  .then((value) async {
                FirebaseAuth.instance.authStateChanges().listen((event) async {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (builder) => HomePage()),
                      (route) => false);
                });
              });
            }).catchError((onError) => errorAwesomeDialog(context, onError));
          });
        }).catchError((onError) {
          errorAwesomeDialog(context, onError.toString());
          print(onError);
        });
      });
    }
  }
  //////////////////////////////////////////////////////////
}
