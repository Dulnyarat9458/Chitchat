import 'dart:io';
import 'dart:ui';

import 'package:chitchat/view/Home/chatlist.dart';
import 'package:chitchat/view/Home/friendlist.dart';
import 'package:chitchat/view/Home/grouplist.dart';
import 'package:chitchat/view/Home/setting.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Firebase.initializeApp();
    super.initState();
  }

  int _currentPage = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          chatList(),
          friendList(),
          groupList(),
          setting(),
        ],
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
      ),
      bottomNavigationBar: BottomBar(
        backgroundColor: const Color(0xff22262f),
        selectedIndex: _currentPage,
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() => _currentPage = index);
        },
        items: <BottomBarItem>[
          BottomBarItem(
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
                CupertinoIcons.chat_bubble_fill,size: 35,
                color: const Color(0xfff04c4d),
              ),
            ),
            title: Text('Chat List',
                style: GoogleFonts.kanit(color: Colors.white70)),
            activeColor: const Color(0xfff6072f).withOpacity(0.7),
          ),
          BottomBarItem(
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
                CupertinoIcons.person_crop_circle_fill,size: 35,
                color: const Color(0xfff04c4d),
              ),
            ),
            title:
                Text('Friend', style: GoogleFonts.kanit(color: Colors.white70)),
            activeColor: Color(0xfff6072f).withOpacity(0.7),
            darkActiveColor: Colors.red.shade400, // Optional
          ),
          BottomBarItem(
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
                CupertinoIcons.person_3_fill,size: 35,
                color: const Color(0xfff04c4d),
              ),
            ),
            title:
                Text('Group', style: GoogleFonts.kanit(color: Colors.white70)),
            activeColor: Color(0xfff6072f).withOpacity(0.7),
            darkActiveColor: Colors.black, // Optional
          ),
          BottomBarItem(
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
                Icons.settings,size: 35,
                color: const Color(0xfff04c4d),
              ),
            ),
            title: Text('Settings',
                style: GoogleFonts.kanit(color: Colors.white70)),
            activeColor: Color(0xfff6072f).withOpacity(0.7),
          ),
        ],
      ),
    );
  }
}
