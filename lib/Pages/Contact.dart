import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  _launchContact(int mobileNumber) {
    launch('tel:${mobileNumber.toString()}');
  }

  _mapLaunch() {
    MapsLauncher.launchCoordinates(28.6588744, 77.202754);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var factor = MediaQuery.of(context).size.aspectRatio;

    var addressText = GoogleFonts.montserrat(
      textStyle: TextStyle(
        fontSize: factor * 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
    var phoneText = GoogleFonts.montserrat(
      textStyle: TextStyle(
        // fontSize: width * 0.037,
        fontSize: factor * 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
    return Container(
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color(0xFF4ea751),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => _mapLaunch(),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                              topLeft: Radius.circular(0),
                              bottomLeft: Radius.circular(0),
                            ),
                          ),
                          height: 150,
                          width: 150,
                          child: Icon(
                            Icons.map_sharp,
                            size: 50,
                            color: Colors.white60,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 40),
                        height: 150,
                        child: Text(
                          '''C-12, First Floor, 
CC Colony,Kalyan Vihar, 
New Delhi, 110007''',
                          style: addressText,
                          // softWrap: true,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color(0xFF11aeef),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          _launchContact(9873011445);
                        },
                        child: Align(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0),
                                bottomLeft: Radius.circular(0),
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                            height: 150,
                            width: 150,
                            child: Icon(
                              Icons.call,
                              size: 50,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 40),
                        alignment: Alignment.center,
                        height: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: InkWell(
                                onTap: () => _launchContact(9873011445),
                                child: Text(
                                  '''+91 9873011445''',
                                  style: phoneText,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: InkWell(
                                onTap: () => _launchContact(9540500107),
                                child: Text(
                                  '''+91 9540500107''',
                                  style: phoneText,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () => _launchContact(9015934113),
                              child: Text(
                                '''+91 9015934113''',
                                style: phoneText,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: InkWell(
                          onTap: () => launch(
                              'https://www.facebook.com/homeflic.wegrow'),
                          child: Image.asset(
                            'Images/Logo/facebook.png',
                            width: width * 0.12,
                            // height: height * 0.12,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: InkWell(
                          onTap: () => launch(
                              'https://www.instagram.com/homeflic_wegrow'),
                          child: Image.asset(
                            'Images/Logo/instagram.png',
                            width: width * 0.12,
                            // height: height * 0.12,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: InkWell(
                          onTap: () => launch(
                              'https://www.linkedin.com/company/homeflic-wegrow/?viewAsMember=true'),
                          child: Image.asset(
                            'Images/Logo/linkedin.png',
                            width: width * 0.12,
                            // height: height * 0.13,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: InkWell(
                          onTap: () => launch(
                              'https://www.youtube.com/channel/UCroIHcTDXo-EL6FQEfQs1Mg'),
                          child: Image.asset(
                            'Images/Logo/youtube.png',
                            width: width * 0.12,
                            // height: height * 0.1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
