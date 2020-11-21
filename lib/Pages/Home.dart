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
    AssetImage('Images/Cards/Champs_Masters.png'),
  ];

  var cardUrl = [
    'https://homeflicwegrow.com/tribe-pass-x.php',
    'https://homeflicwegrow.com/tribe-pass-z.php',
    'https://homeflicwegrow.com/tribe-pass-zplus.php',
    'https://homeflicwegrow.com/wegrow-champs.php',
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
            for (int i = 0; i < snapshot.data["Banner"].length; i++) {
              _imgList.add(
                // Image.network(
                snapshot.data["Banner"][i]["img"].toString(),
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

    var bodyText = GoogleFonts.montserrat(
      textStyle: TextStyle(
        fontSize:
            orentation == Orientation.landscape ? factor * 12 : factor * 30,
        fontWeight: FontWeight.w400,
      ),
    );
    var nameText = GoogleFonts.montserrat(
      textStyle: TextStyle(
        fontSize:
            orentation == Orientation.landscape ? factor * 13 : factor * 30,
        fontWeight: FontWeight.w500,
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
                padding: const EdgeInsets.all(8.0),
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
                          borderRadius: BorderRadius.circular(10),
                          child: new Image.network(
                            _imgList[index],
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                      itemCount: _imgList.length,
                      viewportFraction: 1,
                      scale: 0.9,
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
                        Padding(
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
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 250,
                // width: double.infinit,
                child: Swiper(
                  autoplay: true,
                  autoplayDelay: 6000,
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
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
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
                    top: 25, left: 10, right: 10, bottom: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
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
                height: 250,
                width: double.infinity,
                child: Swiper(
                  layout: SwiperLayout.TINDER,
                  itemWidth: MediaQuery.of(context).size.width,
                  itemHeight: MediaQuery.of(context).size.height * 0.5,
                  itemCount: 4,
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
                            image: cardImage[_idx],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 25, left: 10, right: 10, bottom: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(color: _color[2]),
                    child: Text(
                      'Testimonials',
                      style: headingText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: LimitedBox(
                  maxWidth: double.infinity,
                  maxHeight: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? MediaQuery.of(context).size.width * 0.6
                      : MediaQuery.of(context).size.height * 0.6,
                  child: Swiper(
                    autoplayDelay: 4000,
                    loop: true,
                    autoplay: true,
                    itemBuilder: (BuildContext context, int _idx) {
                      return Center(
                        child: Container(
                          child: Card(
                            elevation: 10,
                            borderOnForeground: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(
                                  color: _color[_idx % 5], width: 10),
                            ),
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: _color[_idx % 5],
                                      radius: MediaQuery.of(context)
                                              .size
                                              .shortestSide *
                                          0.13,
                                      backgroundImage: NetworkImage(
                                          _testimonialList[_idx]['photo']
                                              .toString()),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text(
                                        _testimonialList[_idx]["name"]
                                            .toString(),
                                        style: nameText,
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        _testimonialList[_idx]["college"]
                                            .toString(),
                                        style: nameText,
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        _testimonialList[_idx]["city"]
                                            .toString(),
                                        style: nameText,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 15,
                                          left: 15,
                                          right: 15,
                                          bottom: 5),
                                      child: Text(
                                        _testimonialList[_idx]["testimonial"]
                                            .toString(),
                                        textAlign: TextAlign.justify,
                                        style: bodyText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: _testimonialList.length,
                    viewportFraction: 0.8,
                    scale: 0.9,
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
