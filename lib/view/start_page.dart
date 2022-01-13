import 'dart:ui';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:chitchat/Controller/colors.dart';
import 'package:chitchat/view/Auth/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "eieie",
                style: TextStyle(color: Colors.transparent),
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                      right: 30,
                      bottom: 10,
                    ),
                    padding: const EdgeInsets.all(10),
                    child: ShaderMask(
                      blendMode: BlendMode.srcATop,
                      shaderCallback: (bounds) => const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xfff6072f),
                            Color(0xfff200a1),
                          ]).createShader(bounds),
                      child: const Icon(
                        CupertinoIcons.chat_bubble,
                        color: Color(0xff875ae8),
                        size: 100.0,
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 30,
                            right: 30,
                          ),
                          padding: const EdgeInsets.only(
                            left: 30,
                            right: 30,
                          ),
                          // decoration: const BoxDecoration(
                          //     borderRadius: BorderRadius.all(Radius.circular(1000)),
                          //     color: Color(0xff22262f)),
                          child: Text(
                            "Chit & Chat",
                            style: GoogleFonts.kanit(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 30,
                            right: 30,
                            bottom: 10,
                          ),
                          padding: const EdgeInsets.only(
                            left: 30,
                            right: 30,
                          ),
                          // decoration: const BoxDecoration(
                          //     borderRadius: BorderRadius.all(Radius.circular(1000)),
                          //     color: Color(0xff22262f)),
                          child: Text(
                            "Connect the World",
                            style: GoogleFonts.kanit(
                                color: Colors.white54,
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.transparent,
                  ),
                ],
              ),
              Container(
                  margin: const EdgeInsets.only(bottom: 50),
                  child: buildStartButton())
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStartButton() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: Colors.black12.withOpacity(0.2),
        ),
        borderRadius: BorderRadius.all(Radius.circular(30)),
        gradient: LinearGradient(colors: const [
          Color(0xfff6072f),
          Color(0xfff200a1),
        ]),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          primary: Colors.transparent,
          onSurface: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        child: Text(
            'Get Started',
            style: GoogleFonts.kanit(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
      ),
    );
  }
}
