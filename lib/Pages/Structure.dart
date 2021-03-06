import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wegrow/Pages/Contact.dart';
import 'package:wegrow/Pages/Contact2.dart';
import 'package:wegrow/Pages/FAQ.dart';
import 'package:wegrow/Pages/Home.dart';
import 'package:wegrow/Pages/WhatYouGet.dart';

class Strucutre extends StatefulWidget {
  @override
  _StrucutreState createState() => _StrucutreState();
}

class Index {
  static int idx = 0;

  static void valueSetter(int index) {
    idx = index;
  }

  static refresh(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/');
  }
}

class _StrucutreState extends State<Strucutre> {
  var titles = ['Home', 'WHAT YOU GET?', 'Know Your Wegrow', 'Contact us'];
  var bodies = [
    Home(),
    WhatYouGet(),
    FAQ(),
    Contact2(),
    Contact(),
  ];

  @override
  Widget build(BuildContext context) {
    // var factor = MediaQuery.of(context).size;
    var drawerText = GoogleFonts.montserrat(
      textStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
    );
    var titleText = GoogleFonts.montserrat(
      textStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      fontSize: 22,
    );

    return Scaffold(
      drawer: GFDrawer(
        color: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: Image.asset(
                'Images/Logo.png',
                fit: BoxFit.scaleDown,
              ),
            ),
            GFListTile(
              color: Color(0xFFf24d65),
              title: Text(
                'Home',
                style: drawerText,
              ),
              onTap: () {
                setState(() {
                  Index.idx = 0;
                });
                Navigator.pop(context);
              },
            ),
            GFListTile(
              color: Color(0xFF11aeef),
              title: Text(
                'What You Get ?',
                style: drawerText,
              ),
              onTap: () {
                setState(() {
                  Index.idx = 1;
                });
                Navigator.pop(context);
              },
            ),
            GFListTile(
              color: Color(0xFF4ea751),
              title: Text(
                'Courses',
                style: drawerText,
              ),
              onTap: () {
                launch('https://homeflicwegrow.com/courses.php');
              },
            ),
            GFListTile(
              color: Color(0xFFc2436f),
              title: Text(
                'Know Your Wegrow',
                style: drawerText,
              ),
              onTap: () {
                setState(() {
                  Index.idx = 2;
                });
                Navigator.pop(context);
              },
            ),
            GFListTile(
              color: Color(0xFFe08727),
              title: Text(
                'Contact us',
                style: drawerText,
              ),
              onTap: () {
                setState(() {
                  Index.idx = 3;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: GFAppBar(
        title: Text(
          titles[Index.idx],
          style: titleText,
        ),
        centerTitle: true,
        elevation: 30,
      ),
      body: HawkFabMenu(
        icon: AnimatedIcons.menu_close,
        fabColor: Color(0xFF4ea751),
        blur: 2,
        items: [
          HawkFabMenuItem(
            label: 'Homeflic Wegrow',
            labelColor: Colors.blue,
            ontap: () {
              launch("https://homeflicwegrow.com/index.php#");
            },
            icon: Icon(Icons.language),
          ),
          HawkFabMenuItem(
            label: 'Join Tribe',
            ontap: () {
              launch('https://homeflicwegrow.com/join-tribe.php');
            },
            icon: Icon(Icons.thumb_up_alt_outlined),
            labelColor: Colors.blue,
          ),
        ],
        body: bodies[Index.idx],
      ),
    );
  }
}
