
import 'package:chitchat/view/Auth/change_password_page.dart';
import 'package:chitchat/view/Auth/register_page.dart';
import 'package:chitchat/view/Home/home_page.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

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
      debugShowCheckedModeBanner: true,
      home: Scaffold(
       
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(12),
                  child: Column(children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                      padding: EdgeInsets.only(bottom: 8),
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
            color: Colors.red.shade600,
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
            color: const Color(0xfff200a1),
          ),
        ),
      ),
    );
  }

  InkWell buildButtonSignIn(BuildContext context) {
    return InkWell(
      onTap: () {
        checkAuthentication(context);
      },
      child: Container(
          constraints: const BoxConstraints.expand(width: 300, height: 50),
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
                Color(0xfff6072f),
                Color(0xfff200a1),
              ],
            ),
          ),
          padding: const EdgeInsets.all(8)),
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

  Container buildTextFieldPassword() {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
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
