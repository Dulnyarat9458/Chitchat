import 'dart:io';
import 'dart:ui';

import 'package:chitchat/Controller/dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:chitchat/Controller/gradient_icon.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff22262f),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff1e1f23).withOpacity(0.2),
                    offset: Offset(-6, -6),
                    spreadRadius: 6,
                    blurRadius: 6,
                  ),
                  BoxShadow(
                    color: Color(0xff1e1f23).withOpacity(0.2),
                    offset: Offset(6, 6),
                    spreadRadius: 6,
                    blurRadius: 6,
                  )
                ],
                borderRadius: BorderRadius.only(topRight: Radius.circular(330)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff3d4048),
                    Color(0xff1a1d24),
                  ],
                )),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(top: 36, bottom: 6, left: 46),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color(0xff22262f),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff3d3c45).withOpacity(1),
                                    offset: Offset(-4, -4),
                                    spreadRadius: 6,
                                    blurRadius: 3,
                                  ),
                                  BoxShadow(
                                    color: Color(0xff1e1f23).withOpacity(0.2),
                                    offset: Offset(4, 4),
                                    spreadRadius: 6,
                                    blurRadius: 3,
                                  )
                                ],
                              ),
                              child: Container(
                                child: IconButton(
                                  icon: GradientIcon(
                                    CupertinoIcons.chevron_back,
                                    32.0,
                                    const LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: <Color>[
                                        Color(0xffb259e7),
                                        Color(0xff875ae8),
                                      ],
                                    ),
                                  ),
                                  onPressed: () {
                                    {
                                      Navigator.pop(context);
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(),
                        Container(),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(12),
                      child: Column(children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(bottom: 8, left: 16),
                          child: Row(
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
                        Container(
                          padding: EdgeInsets.only(bottom: 8, left: 16),
                          child: Row(
                            children: [
                              Text(
                                "Please Create your Account",
                                style: GoogleFonts.kanit(
                                    color: Colors.white54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.transparent,
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
        onPressed: () {},
        child: Text(
          'Already have an Account',
          style: GoogleFonts.kanit(
            color: const Color(0xff7ca8ff),
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
                  Color(0xff875ae8),
                  Color(0xffb259e7),
                ],
              ),
              boxShadow: [
                const BoxShadow(
                  color: Color(0xff3d3c45),
                  offset: Offset(-4, -4),
                  spreadRadius: 5,
                  blurRadius: 5,
                ),
                const BoxShadow(
                  color: Color(0xff1e1f23),
                  offset: Offset(4, 4),
                  spreadRadius: 5,
                  blurRadius: 5,
                )
              ],
            ),
            margin: const EdgeInsets.only(top: 12),
            padding: const EdgeInsets.all(8)),
      ),
    );
  }

  Future<Null> checkAuthentication(BuildContext context) async {
    // await Firebase.initializeApp().then((value) async {
    //   await FirebaseAuth.instance
    //       .signInWithEmailAndPassword(email: email, password: password)
    //       .then((value) async {
    //     FirebaseAuth.instance.authStateChanges().listen((event) async {
    //       String uid = event!.uid;
    //       print('########### uid --> $uid #############');
    //       await FirebaseFirestore.instance
    //           .collection('users')
    //           .doc(uid)
    //           .get()
    //           .then((value) {
    //         getinf = value.data()!['typeuser'];

    //         print('########### typeUser --> $getinf');
    //         switch (getinf) {
    //           case 'customer':
    //             Navigator.pushNamedAndRemoveUntil(
    //                 context, '/myHomeCustomer', (route) => false);
    //             break;
    //           case 'technicien':
    //             Navigator.pushNamedAndRemoveUntil(
    //                 context, '/myHomeTechnicien', (route) => false);
    //             break;
    //           default:
    //             print('##### No TypeUser ####');
    //             Navigator.pushNamedAndRemoveUntil(
    //                 context, '/login', (route) => false);
    //             break;
    //         }
    //       });
    //     });
    //   });
    // }).catchError((value) => errorAwesomeDialog(
    //       context,
    //       "ไม่สามารถเข้าสู่ระบบได้",
    //     ));
  }

  Container buildTextFieldUsername() {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: Color(0xff3d3c45),
              offset: Offset(1, 1),
              spreadRadius: -2,
              blurRadius: 5,
            ),
            BoxShadow(
              color: Color(0xff1e1f23),
              offset: Offset(-1, -1),
              spreadRadius: -2,
              blurRadius: 5,
            )
          ],
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
              prefixIcon: Icon(
                Icons.person,
                color: const Color(0xff7ca8ff),
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
          boxShadow: [
            BoxShadow(
              color: Color(0xff3d3c45),
              offset: Offset(1, 1),
              spreadRadius: -2,
              blurRadius: 5,
            ),
            BoxShadow(
              color: Color(0xff1e1f23),
              offset: Offset(-1, -1),
              spreadRadius: -2,
              blurRadius: 5,
            )
          ],
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
              prefixIcon: Icon(
                Icons.email,
                color: const Color(0xff7ca8ff),
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
          boxShadow: [
            BoxShadow(
              color: Color(0xff3d3c45),
              offset: Offset(1, 1),
              spreadRadius: -2,
              blurRadius: 5,
            ),
            BoxShadow(
              color: Color(0xff1e1f23),
              offset: Offset(-1, -1),
              spreadRadius: -2,
              blurRadius: 5,
            )
          ],
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
              prefixIcon: Icon(
                Icons.lock,
                color: const Color(0xff7ca8ff),
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
          boxShadow: [
            BoxShadow(
              color: Color(0xff3d3c45),
              offset: Offset(1, 1),
              spreadRadius: -2,
              blurRadius: 5,
            ),
            BoxShadow(
              color: Color(0xff1e1f23),
              offset: Offset(-1, -1),
              spreadRadius: -2,
              blurRadius: 5,
            )
          ],
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
              prefixIcon: Icon(
                Icons.refresh,
                color: const Color(0xff7ca8ff),
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
              "profile_picture":
                  "https://firebasestorage.googleapis.com/v0/b/chitchat-a40ab.appspot.com/o/profile_picture%2Fdefault.png?alt=media&token=110bfa3c-200c-48c1-a3df-747b28b4a5c3"
            }).then((value) {
              print('Insert Value To Firestore Success');
            }).catchError((onError) => errorAwesomeDialog(context, onError));
          });
        }).catchError((onError) { errorAwesomeDialog(context, onError.toString());print(onError);});
      });
    }
  }
  //////////////////////////////////////////////////////////
}
