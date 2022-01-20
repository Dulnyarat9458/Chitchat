//import 'dart:html';

import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

// ignore: unused_import
import 'package:http/http.dart' as http;

Future<Null> successAwesomeDialog(BuildContext context, String title) async {
  AwesomeDialog(
    context: context,
    dialogBackgroundColor: Color(0xff16181c).withOpacity(0.75),
    animType: AnimType.SCALE,
    dialogType: DialogType.SUCCES,
    body: Container(
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.kanit(fontSize: 20, color: Colors.white),
        ),
      ),
    ),
    btnOkColor: Color(0xff2d9cfc),
    btnOkOnPress: () {
     
    },
    //  btnCancelOnPress: () {},
  )..show();
}

Future<Null> errorAwesomeDialog(BuildContext context, String title) async {
  AwesomeDialog(
    context: context,
    dialogBackgroundColor: Color(0xff16181c).withOpacity(0.75),
    animType: AnimType.SCALE,
    dialogType: DialogType.ERROR,
    body: Container(
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.kanit(fontSize: 20, color: Colors.white),
        ),
      ),
    ),
    btnOkColor: Colors.red,
    btnOkOnPress: () {},
    //  btnCancelOnPress: () {},
  ).show();
}