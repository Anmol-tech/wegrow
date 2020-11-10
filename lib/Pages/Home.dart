import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

import 'DownloadData.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var makeCall = MakeCall();
  var imgList = <Widget>[];
  var testimonialList = [];

  int dataLength;
  final databaseReference = FirebaseDatabase.instance.reference();

  _futureBanner() {
    return FutureBuilder(
        future: makeCall.firebaseBannerCalls(databaseReference),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data != null) {
            for (int i = 0; i < snapshot.data["Banner"].length; i++)
              imgList.add(Image.network(
                snapshot.data["Banner"][i]["img"],
                fit: BoxFit.contain,
              ));

            for (int i = 0; i < snapshot.data["Testimonial"].length; i++) {
              var data = snapshot.data["Testimonial"].values.toList()[i];
              testimonialList.add(data);
            }

            return _body();
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  _body() {
    var factor = MediaQuery.of(context).size.aspectRatio;

    var color = [
      Color(0xFFf24d65),
      Color(0xFF11aeef),
      Color(0xFF4ea751),
      Color(0XFFc2436f),
      Color(0xFFe08727),
    ];

    var headingText = GoogleFonts.montserrat(
      textStyle: TextStyle(
        fontSize: 50 * factor,
        fontWeight: FontWeight.w500,
        color: Colors.black54,
      ),
    );

    var bodyText = GoogleFonts.montserrat(
      textStyle: TextStyle(
        fontSize: 24 * factor,
        fontWeight: FontWeight.w400,
      ),
    );
    var nameText = GoogleFonts.montserrat(
      textStyle: TextStyle(
        fontSize: 24 * factor,
        fontWeight: FontWeight.w500,
      ),
    );
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GFCarousel(
                aspectRatio: 1.77,
                autoPlay: true,
                items: imgList,
                viewportFraction: 100.0,
                // pagination: true,
                pauseAutoPlayOnTouch: Duration(seconds: 3),
                scrollPhysics: BouncingScrollPhysics(),
              ),
              Container(
                  child: Text(
                'Testimonials',
                style: headingText,
              )),
              SizedBox(
                width: double.infinity,
                height: 520 * factor,
                child: ListView.builder(
                  addAutomaticKeepAlives: true,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: testimonialList.length,
                  itemBuilder: (BuildContext context, int _idx) {
                    return Container(
                      width: 550 * factor,
                      child: Card(
                        elevation: 5,
                        borderOnForeground: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: color[_idx % 5], width: 5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: CircleAvatar(
                                backgroundColor: color[_idx % 5],
                                radius: 75 * factor,
                                backgroundImage: NetworkImage(
                                    testimonialList[_idx]['photo'].toString()),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                testimonialList[_idx]["name"].toString(),
                                style: nameText,
                              ),
                            ),
                            Container(
                              child: Text(
                                testimonialList[_idx]["college"].toString(),
                                style: nameText,
                              ),
                            ),
                            Container(
                              child: Text(
                                testimonialList[_idx]["city"].toString(),
                                style: nameText,
                              ),
                            ),
                            SingleChildScrollView(
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 15, left: 15, right: 15, bottom: 5),
                                child: Text(
                                  testimonialList[_idx]["testimonial"]
                                      .toString(),
                                  style: bodyText,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
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
