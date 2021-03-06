
import 'package:chitchat/Controller/gradient_icon.dart';
import 'package:chitchat/view/Auth/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class ChangePasswordPage extends StatefulWidget {
  ChangePasswordPage({Key? key}) : super(key: key);
  @override
  _ChangePasswordPagestate createState() => _ChangePasswordPagestate();
}

class _ChangePasswordPagestate extends State<ChangePasswordPage> {
  late String email, password, getinf;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            alignment: Alignment.center,
            child: Center(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(top: 40, bottom: 6, left: 46),
                              child: Container(
                                child: IconButton(
                                  icon: GradientIcon(
                                    CupertinoIcons.chevron_back,
                                    32.0,
                                    const LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: <Color>[
                                        Color(0xfff6072f),
                                        Color(0xfff200a1),
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
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 8, left: 16),
                              child: Row(
                                children: [
                                  Text(
                                    "Reset Password",
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
                                    "Please Enter your Email",
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
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            children: [
                              buildTextFieldEmail(),
                            ],
                          ),
                        ),
                        buildButtonSignIn(context),
                      ]),
                    ), Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(top: 40, bottom: 6, left: 46),
                              child: Container(
                                child: IconButton(
                                  icon: GradientIcon(
                                    CupertinoIcons.chevron_back,
                                    32.0,
                                    const LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: <Color>[
                                        Colors.transparent,
                                        Colors.transparent,
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
          Navigator.pop(context);
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
                  Color(0xfff6072f),
                  Color(0xfff200a1),
                ],
              ),
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
    //       "?????????????????????????????????????????????????????????????????????",
    //     ));
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
