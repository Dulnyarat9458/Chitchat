import 'dart:ui';

import 'package:chitchat/Controller/gradient_icon.dart';
import 'package:chitchat/view/Auth/change_password_page.dart';
import 'package:chitchat/view/Auth/register_page.dart';
import 'package:chitchat/view/Home/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String email, password, getinf;

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
                borderRadius:
                    const BorderRadius.only(topRight: Radius.circular(330)),
                gradient: const LinearGradient(
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
                                "Sign in",
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
                                "Please Sign in to continue",
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
                        Container(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            children: [
                              buildTextFieldEmail(),
                              buildTextFieldPassword(),
                            ],
                          ),
                        ),
                        buildForgetPasswordButton(context),
                        buildButtonSignIn(context),
                        Divider(
                          color: Colors.transparent,
                        ),
                        buildButtonSignInGoogle(context),
                        Text("\n"),
                        Center(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                              Text("Don't have an account?",
                                  style: GoogleFonts.kanit(
                                      color: const Color(0xff677381),
                                      fontSize: 16)),
                              Text("   "),
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
  Container buildForgetPasswordButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10),
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChangePasswordPage()),
          );
        },
        child: Text(
          'Forgot Password?',
          style: GoogleFonts.kanit(
            color: const Color(0xff9c75e2),
          ),
        ),
      ),
    );
  }

  Container buildSignupButton(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegisterPage()),
          );
        },
        child: Text(
          'Sign Up',
          style: GoogleFonts.kanit(
            color: const Color(0xff7ca8ff),
          ),
        ),
      ),
    );
  }

  Container buildButtonSignIn(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          checkAuthentication(context);
        },
        child: Container(
            constraints: BoxConstraints.expand(width: 300, height: 50),
            child: Text(
              "Sign in",
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

  Container buildButtonSignInGoogle(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          checkAuthentication(context);
        },
        child: Container(
            constraints: BoxConstraints.expand(width: 300, height: 50),
            child: Text(
              "Continue with Google",
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
                  Color(0xffa63430),
                  Color(0xfff04c4d),
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
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        FirebaseAuth.instance.authStateChanges().listen((event) async {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (builder) => HomePage()),
              (route) => false);
        });
      });
    });
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
        child: TextField(
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

  //////////////////////////////////////////////////////////
}
