import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact2 extends StatefulWidget {
  @override
  _Contact2State createState() => _Contact2State();
}

class _Contact2State extends State<Contact2> {
  _getheight(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    print(height);

    return MediaQuery.of(context).orientation == Orientation.portrait
        ? MediaQuery.of(context).size.width * .7
        : MediaQuery.of(context).size.width * .45;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xFF429AE0),
              child: Container(
                height: _getheight(context),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomLeft: Radius.circular(60),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Image.asset(
                              'Images/Contact/sofa-girl.png',
                              width: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? MediaQuery.of(context).size.width * .5
                                  : MediaQuery.of(context).size.width * .36,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? MediaQuery.of(context).size.width * .04
                                  : MediaQuery.of(context).size.width * .36,
                            ),
                            width: 140,
                            height: 140,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('Images/Contact/topright.png'),
                                fit: BoxFit.fill,
                                alignment: Alignment.centerLeft,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Image.asset(
                                'Images/wegrow.png',
                                width: 80,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Card(
                        shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        elevation: 40,
                        child: Padding(
                          padding: EdgeInsets.all(
                            MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? 20
                                : 15.0,
                          ),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize: MediaQuery.of(context)
                                              .orientation ==
                                          Orientation.portrait
                                      ? MediaQuery.of(context).size.width * .044
                                      : MediaQuery.of(context).size.width *
                                          .036,
                                  color: Colors.black87,
                                ),
                              ),
                              // style: TextStyle(fontSize: 15, color: Colors.black87),
                              children: [
                                TextSpan(
                                  text: '''Need help? Contact us \nat''',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: " hello@homeflicwegrow.com",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: "\nor call us at",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: " 7217015332/33/37",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 60),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF429AE0),
                borderRadius: BorderRadius.only(topRight: Radius.circular(40)),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? MediaQuery.of(context).size.width * .8
                        : MediaQuery.of(context).size.width * .9,
                    height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? MediaQuery.of(context).size.width * .4
                        : MediaQuery.of(context).size.width * .36,
                    child: Card(
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 5.0,
                                      bottom: 5.0,
                                    ),
                                    child: Material(
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: InkWell(
                                        onTap: () => launch(
                                            'https://www.facebook.com/homeflic.wegrow'),
                                        child: Image.asset(
                                          'Images/Icons/facebook.png',
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.15,
                                          // height: height * 0.12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 5.0, bottom: 5.0),
                                    child: Material(
                                      elevation: 10,
                                      // color: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: InkWell(
                                        onTap: () => launch(
                                            'https://www.instagram.com/homeflic_wegrow'),
                                        child: Image.asset(
                                          'Images/Icons/instagram.png',
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.15,
                                          // height: height * 0.12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 5.0,
                                    ),
                                    child: Material(
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: InkWell(
                                        onTap: () => launch(
                                            'https://www.youtube.com/channel/UCroIHcTDXo-EL6FQEfQs1Mg'),
                                        child: Image.asset(
                                          'Images/Icons/youtube.png',
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.15,
                                          // height: height * 0.1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: 5.0,
                                          ),
                                          child: Material(
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: InkWell(
                                              // onTap: () => launch(
                                              //     'https://www.linkedin.com/company/homeflic-wegrow/?viewAsMember=true'),
                                              child: Image.asset(
                                                'Images/Icons/telegram.png',
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.15,
                                                // height: height * 0.13,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: 5.0,
                                          ),
                                          child: Material(
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: InkWell(
                                              onTap: () => launch(
                                                  'https://www.linkedin.com/company/homeflic-wegrow/?viewAsMember=true'),
                                              child: Image.asset(
                                                'Images/Icons/linkdin.png',
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.15,
                                                // height: height * 0.13,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Material(
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: InkWell(
                                            onTap: () => launch(
                                                'https://wa.me/message/WC3YN7HY5M7ZC1'),
                                            child: Image.asset(
                                              'Images/Icons/whatsapp.png',
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.15,
                                              // height: height * 0.13,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Image.asset(
                            'Images/Contact/standing-girl.png',
                            width: MediaQuery.of(context).size.width * 0.22,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? MediaQuery.of(context).size.width * .8
                        : MediaQuery.of(context).size.width * .9,
                    child: Card(
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'www.homeflicwegrow.com',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? MediaQuery.of(context).size.width * .04
                                  : MediaQuery.of(context).size.width * .05,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? MediaQuery.of(context).size.width * .8
                        : MediaQuery.of(context).size.width * .9,
                    child: Card(
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'CC Colony, Kalyan Vihar, New Delhi',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? MediaQuery.of(context).size.width * .035
                                  : MediaQuery.of(context).size.width * .04,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    width: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? MediaQuery.of(context).size.width * .5
                        : MediaQuery.of(context).size.width * .5,
                    child: Card(
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Color(0xFFFCEE21),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: RichText(
                          softWrap: true,
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: MediaQuery.of(context).orientation ==
                                        Orientation.portrait
                                    ? MediaQuery.of(context).size.width * .039
                                    : MediaQuery.of(context).size.width * .04,
                              ),
                            ),
                            children: [
                              TextSpan(text: "Wanna"),
                              TextSpan(
                                text: " know more?",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
