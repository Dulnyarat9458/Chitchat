import 'dart:ui';

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
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff3d4048),
            Color(0xff1a1d24),
          ],
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 85,
                      left: 30,
                      right: 30,
                      bottom: 10,
                    ),
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 5,
                          color: Colors.black12.withOpacity(0.1),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff3d3c45),
                            offset: Offset(-6, -6),
                            spreadRadius: 3,
                            blurRadius: 4,
                          ),
                          BoxShadow(
                            color: Color(0xff1e1f23).withOpacity(0.3),
                            offset: Offset(6, 6),
                            spreadRadius: 3,
                            blurRadius: 4,
                          )
                        ],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(1000)),
                        color: const Color(0xff22262f)),
                    child: const Icon(
                      CupertinoIcons.chat_bubble,
                      color: Color(0xff875ae8),
                      size: 200.0,
                    ),
                  ),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  Column(
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
                              fontSize: 45,
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
                              fontSize: 18,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                  margin: const EdgeInsets.only(bottom: 50),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 3,
                        color: Colors.black12.withOpacity(0.2),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xff3d3c45),
                          offset: Offset(-6, -6),
                          spreadRadius: 5,
                          blurRadius: 5,
                        ),
                        BoxShadow(
                          color: Color(0xff101114),
                          offset: Offset(6, 6),
                          spreadRadius: 5,
                          blurRadius: 5,
                        )
                      ],
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xff875ae8),
                          Color(0xffb259e7),
                        ],
                      )),
                  child: buildStartButton())
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStartButton() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        gradient: LinearGradient(colors: [
          Color(0xffb259e7),
          Color(0xff875ae8),
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
          "Get Started",
          style: GoogleFonts.kanit(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
