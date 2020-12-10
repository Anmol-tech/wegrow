import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'DownloadData.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _makeCall = MakeCall();
  var _imgList = [];
  var _testimonialList = [];
  var _lowwerBannerList = [];
  var _loop = false;

  var bandHeading = [
    "What?",
    "Who?",
    "S.C.O.P.E",
    '''YOUTH 
INTERNSHIP 
PROGRAMME''',
  ];

  var bandBodyText = [
    '''It’s a platform where people can showcase their talent, discuss their problems, talk about trending topics and build a network stronger than any bond. Focusing on holistic development of our members along with us, we believe in learning, working, and growing together. We talk, connect, achieve and celebrate as a tribe.''',
    '''WE ARE THE YOUTH with a vision of personal growth along with the growth of people around us. Our main objective as a tribe is to reach out to young curious minds and help and guide them in every way possible.''',
    '''S.C.O.P.E expands into Student Community Outreach Programme for Es wherein E stands for our Essue of the month [Essentials, Empowerment, Environment, Education etc.] and changes periodically, owing to changing  social scenarios.''',
    '''Homeflic Wegrow brings to you an incredible and the coolest opportunity! This is a great medium through which you can learn numerous skills. While working with us you will network with many people, from whom you can learn a lot and gain training experience.
Here at Homeflic Wegrow, we have built an environment of an empathetic nature where individuals not only work, learn, or achieve but grow as an individual and a professional.
'''
  ];

  var cardImage = [
    AssetImage('Images/Cards/Tribe_Pass_X.png'),
    AssetImage('Images/Cards/Tribe_Pass_Z.png'),
    AssetImage('Images/Cards/Tribe_Pass_Zplus.png'),
  ];

  var kidCardImage = [AssetImage('Images/Cards/Champs_Masters.png')];

  var kidCardUrl = [
    'https://homeflicwegrow.com/wegrow-champs.php',
  ];

  var cardUrl = [
    'https://homeflicwegrow.com/tribe-pass-x.php',
    'https://homeflicwegrow.com/tribe-pass-z.php',
    'https://homeflicwegrow.com/tribe-pass-zplus.php',
  ];

  var coursesImage = [
    AssetImage('Images/Courses/Group 4.png'),
    AssetImage('Images/Courses/Group 5.png'),
    AssetImage('Images/Courses/Group 6.png'),
    AssetImage('Images/Courses/Group 7.png'),
    AssetImage('Images/Courses/Group 8.png'),
    AssetImage('Images/Courses/Group 16.png'),
  ];

  var coursesUrl = [
    'https://homeflicwegrow.com/music.php',
    'https://homeflicwegrow.com/graphic-design.php',
    'https://homeflicwegrow.com/nism.php',
    'https://homeflicwegrow.com/ethical-hacking.php',
    'https://homeflicwegrow.com/digital-marketing.php',
    'https://homeflicwegrow.com/python.php',
  ];

  var _color = [
    Color(0xFFf24d65),
    Color(0xFF11aeef),
    Color(0xFF4ea751),
    Color(0XFFc2436f),
    Color(0xFFe08727),
  ];

  final _databaseReference = FirebaseDatabase.instance.reference();

  _futureBanner() {
    return FutureBuilder(
        future: _makeCall.firebaseBannerCalls(_databaseReference),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data != null) {
            _imgList.clear();
            _testimonialList.clear();
            _lowwerBannerList.clear();
            for (int i = 0; i < snapshot.data["Banner"].length; i++) {
              _imgList.add(
                // Image.network(
                snapshot.data["Banner"][i]["img"].toString(),
                // fit: BoxFit.fill,
                // ),
              );
            }
            for (int i = 0; i < snapshot.data["LowwerBanner"].length; i++) {
              _lowwerBannerList.add(
                // Image.network(
                snapshot.data["LowwerBanner"][i]["img"].toString(),

                // fit: BoxFit.fill,
                // ),
              );
            }
            for (int i = 0; i < snapshot.data["Testimonial"].length; i++) {
              var data = snapshot.data["Testimonial"].values.toList()[i];

              _testimonialList.add(data);
            }

            if (_imgList.length > 1) _loop = true;

            return _body();
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  _body() {
    var factor = MediaQuery.of(context).size.aspectRatio;

    var orentation = MediaQuery.of(context).orientation;

    var headingText = GoogleFonts.montserrat(
      textStyle: TextStyle(
        fontSize:
            orentation == Orientation.landscape ? factor * 20 : factor * 40,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: LimitedBox(
                  // maxHeight: 200,
                  child: AspectRatio(
                    aspectRatio:
                        MediaQuery.of(context).orientation.toString() ==
                                Orientation.landscape.toString()
                            ? 2.4
                            : 1.75,
                    child: Swiper(
                      autoplay: _loop,
                      loop: _loop,
                      itemBuilder: (BuildContext context, int index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(0),
                          child: new Image.network(
                            _imgList[index],
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                      itemCount: _imgList.length,
                      viewportFraction: 1,
                      scale: 1,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Card(
                  color: Colors.grey[300],
                  elevation: 5,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                          ),
                          child: Text(
                            "WEGROW TRIBE",
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 30),
                            child: Text(
                              "Homeflic wegrow is a tribe of people from all over the world, having diverse mindsets and personalities, learning and growing together. It’s a platform where people can showcase their talent, discuss their problems, talk about trending topics and build a network stronger than any bond. Focusing on holistic development of our members along with us, we believe in learning, working, and growing together.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 250,
                child: Swiper(
                  autoplay: true,
                  autoplayDelay: 4000,
                  layout: SwiperLayout.STACK,
                  itemWidth: MediaQuery.of(context).size.width * 0.8,
                  itemHeight: 300.0,
                  itemCount: bandBodyText.length,
                  viewportFraction: 1,
                  itemBuilder: (BuildContext context, int _idx) {
                    return Card(
                      color: _color[_idx],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              bandHeading[_idx],
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.44,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 18),
                              child: SingleChildScrollView(
                                child: Text(
                                  bandBodyText[_idx],
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 25, left: 0, right: 0, bottom: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(color: _color[1]),
                    child: Text(
                      'Join Tribe',
                      style: headingText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                child: Swiper(
                  layout: SwiperLayout.TINDER,
                  itemWidth: MediaQuery.of(context).size.width,
                  itemHeight: MediaQuery.of(context).size.height * 0.4,
                  itemCount: 3,
                  autoplay: true,
                  autoplayDelay: 6000,
                  loop: true,
                  onTap: (index) {
                    launch(cardUrl[index]);
                  },
                  itemBuilder: (BuildContext context, int _idx) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: cardImage[_idx], fit: BoxFit.fill),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 25, left: 0, right: 0, bottom: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(color: _color[2]),
                    child: Text(
                      'Wegrow Champs / Masters',
                      style: headingText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                child: InkWell(
                  onTap: () => launch(kidCardUrl[0]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: kidCardImage[0], fit: BoxFit.fill),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 25, left: 0, right: 0, bottom: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(color: _color[3]),
                    child: Text(
                      'Courses',
                      style: headingText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.65,
                width: double.infinity,
                child: Swiper(
                  layout: SwiperLayout.TINDER,
                  itemWidth: MediaQuery.of(context).size.width,
                  itemHeight: MediaQuery.of(context).size.height * 0.65,
                  itemCount: 6,
                  autoplay: true,
                  autoplayDelay: 6000,
                  loop: true,
                  onTap: (index) {
                    launch(coursesUrl[index]);
                  },
                  itemBuilder: (BuildContext context, int _idx) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: coursesImage[_idx],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.65,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 5.0),
                  child: Swiper(
                    viewportFraction: 0.8,
                    itemWidth: MediaQuery.of(context).size.width,
                    itemHeight: MediaQuery.of(context).size.height * 0.65,
                    itemCount: _lowwerBannerList.length,
                    autoplay: true,
                    autoplayDelay: 6000,
                    loop: true,
                    // onTap: (index) {
                    //   launch(coursesUrl[index]);
                    // },
                    itemBuilder: (BuildContext context, int _idx) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Material(
                            elevation: 20,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    _lowwerBannerList[_idx],
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //       top: 25, left: 10, right: 10, bottom: 10),
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(15),
              //     child: Container(
              //       padding: EdgeInsets.all(10),
              //       width: double.infinity,
              //       decoration: BoxDecoration(color: _color[2]),
              //       child: Text(
              //         'Testimonials',
              //         style: headingText,
              //         textAlign: TextAlign.center,
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 10.0),
              //   child: LimitedBox(
              //     maxWidth: double.infinity,
              //     maxHeight: MediaQuery.of(context).orientation ==
              //             Orientation.landscape
              //         ? MediaQuery.of(context).size.width * 0.6
              //         : MediaQuery.of(context).size.height * 0.6,
              //     child: Swiper(
              //       autoplayDelay: 4000,
              //       loop: true,
              //       autoplay: true,
              //       itemBuilder: (BuildContext context, int _idx) {
              //         return Center(
              //           child: Container(
              //             child: Card(
              //               elevation: 10,
              //               borderOnForeground: true,
              //               shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(20),
              //                 side: BorderSide(
              //                     color: _color[_idx % 5], width: 10),
              //               ),
              //               child: SingleChildScrollView(
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(30.0),
              //                   child: Column(
              //                     crossAxisAlignment: CrossAxisAlignment.center,
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     children: [
              //                       CircleAvatar(
              //                         backgroundColor: _color[_idx % 5],
              //                         radius: MediaQuery.of(context)
              //                                 .size
              //                                 .shortestSide *
              //                             0.13,
              //                         backgroundImage: NetworkImage(
              //                             _testimonialList[_idx]['photo']
              //                                 .toString()),
              //                       ),
              //                       Container(
              //                         margin: EdgeInsets.only(top: 10),
              //                         child: Text(
              //                           _testimonialList[_idx]["name"]
              //                               .toString(),
              //                           style: nameText,
              //                         ),
              //                       ),
              //                       Container(
              //                         child: Text(
              //                           _testimonialList[_idx]["college"]
              //                               .toString(),
              //                           style: nameText,
              //                         ),
              //                       ),
              //                       Container(
              //                         child: Text(
              //                           _testimonialList[_idx]["city"]
              //                               .toString(),
              //                           style: nameText,
              //                         ),
              //                       ),
              //                       Container(
              //                         margin: EdgeInsets.only(
              //                             top: 15,
              //                             left: 15,
              //                             right: 15,
              //                             bottom: 5),
              //                         child: Text(
              //                           _testimonialList[_idx]["testimonial"]
              //                               .toString(),
              //                           textAlign: TextAlign.justify,
              //                           style: bodyText,
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ),
              //         );
              //       },
              //       itemCount: _testimonialList.length,
              //       viewportFraction: 0.8,
              //       scale: 0.9,
              //     ),
              //   ),
              // ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 80),
                width: MediaQuery.of(context).size.width * 0.98,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFffc18f),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Material(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: InkWell(
                                onTap: () => launch(
                                    'https://www.facebook.com/homeflic.wegrow'),
                                child: Image.asset(
                                  'Images/Icons/facebook.png',
                                  width:
                                      MediaQuery.of(context).size.width * 0.08,
                                  // height: height * 0.12,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: Material(
                              elevation: 10,
                              // color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: InkWell(
                                onTap: () => launch(
                                    'https://www.instagram.com/homeflic_wegrow'),
                                child: Image.asset(
                                  'Images/Icons/instagram.png',
                                  width:
                                      MediaQuery.of(context).size.width * 0.08,
                                  // height: height * 0.12,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Material(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: InkWell(
                                onTap: () => launch(
                                    'https://www.linkedin.com/company/homeflic-wegrow/?viewAsMember=true'),
                                child: Image.asset(
                                  'Images/Icons/linkdin.png',
                                  width:
                                      MediaQuery.of(context).size.width * 0.08,
                                  // height: height * 0.13,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 0),
                            child: Material(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: InkWell(
                                onTap: () => launch(
                                    'https://wa.me/message/WC3YN7HY5M7ZC1'),
                                child: Image.asset(
                                  'Images/Icons/whatsapp.png',
                                  width:
                                      MediaQuery.of(context).size.width * 0.08,
                                  // height: height * 0.1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.033,
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _futureBanner();
    // return Container();
  }
}
