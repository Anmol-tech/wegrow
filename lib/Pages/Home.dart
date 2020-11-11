import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';

import 'DownloadData.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var makeCall = MakeCall();
  var imgList = [];
  var testimonialList = [];
  var loop = false;

  int dataLength;
  final databaseReference = FirebaseDatabase.instance.reference();

  _futureBanner() {
    return FutureBuilder(
        future: makeCall.firebaseBannerCalls(databaseReference),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data != null) {
            imgList.clear();
            testimonialList.clear();
            for (int i = 0; i < snapshot.data["Banner"].length; i++) {
              imgList.add(
                // Image.network(
                snapshot.data["Banner"][i]["img"].toString(),
                // fit: BoxFit.fill,
                // ),
              );
            }
            for (int i = 0; i < snapshot.data["Testimonial"].length; i++) {
              var data = snapshot.data["Testimonial"].values.toList()[i];

              testimonialList.add(data);
            }

            if (imgList.length > 1) loop = true;

            return _body();
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  _body() {
    var factor = MediaQuery.of(context).size.aspectRatio;

    var orentation = MediaQuery.of(context).orientation;

    var color = [
      Color(0xFFf24d65),
      Color(0xFF11aeef),
      Color(0xFF4ea751),
      Color(0XFFc2436f),
      Color(0xFFe08727),
    ];

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
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LimitedBox(
                // maxHeight: 200,
                child: AspectRatio(
                  aspectRatio: MediaQuery.of(context).orientation.toString() ==
                          Orientation.landscape.toString()
                      ? 2.4
                      : 1.75,
                  child: Swiper(
                    autoplay: loop,
                    loop: loop,
                    itemBuilder: (BuildContext context, int index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: new Image.network(
                          imgList[index],
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                    itemCount: imgList.length,
                    viewportFraction: 1,
                    scale: 0.9,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(color: color[2]),
                    child: Text(
                      'Testimonials',
                      style: headingText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),

              AspectRatio(
                aspectRatio: MediaQuery.of(context).orientation.toString() ==
                        Orientation.landscape.toString()
                    ? 3
                    : 1,
                child: Swiper(
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
                            side: BorderSide(color: color[_idx % 5], width: 10),
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: color[_idx % 5],
                                    radius: MediaQuery.of(context)
                                            .size
                                            .shortestSide *
                                        0.13,
                                    backgroundImage: NetworkImage(
                                        testimonialList[_idx]['photo']
                                            .toString()),
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
                                      testimonialList[_idx]["college"]
                                          .toString(),
                                      style: nameText,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      testimonialList[_idx]["city"].toString(),
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
                                      testimonialList[_idx]["testimonial"]
                                          .toString(),
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
                  itemCount: testimonialList.length,
                  viewportFraction: 0.8,
                  scale: 0.9,
                ),
              ),

              // LimitedBox(
              //   maxHeight: 350,

              //   // height: 300,
              //   child: ListView.builder(
              //     addAutomaticKeepAlives: true,
              //     physics: BouncingScrollPhysics(),
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     itemCount: testimonialList.length,
              //     itemBuilder: (BuildContext context, int _idx) {
              //       return Container(
              //         width: 350,
              //         child: Card(
              //           elevation: 5,
              //           borderOnForeground: true,
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(20),
              //             side: BorderSide(color: color[_idx % 5], width: 5),
              //           ),
              //           child: SingleChildScrollView(
              //             child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.center,
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               children: [
              //                 Padding(
              //                   padding: EdgeInsets.only(top: 20),
              //                   child: CircleAvatar(
              //                     backgroundColor: color[_idx % 5],
              //                     radius:
              //                         MediaQuery.of(context).size.shortestSide *
              //                             0.13,
              //                     backgroundImage: NetworkImage(
              //                         testimonialList[_idx]['photo']
              //                             .toString()),
              //                   ),
              //                 ),
              //                 Container(
              //                   margin: EdgeInsets.only(top: 10),
              //                   child: Text(
              //                     testimonialList[_idx]["name"].toString(),
              //                     style: nameText,
              //                   ),
              //                 ),
              //                 Container(
              //                   child: Text(
              //                     testimonialList[_idx]["college"].toString(),
              //                     style: nameText,
              //                   ),
              //                 ),
              //                 Container(
              //                   child: Text(
              //                     testimonialList[_idx]["city"].toString(),
              //                     style: nameText,
              //                   ),
              //                 ),
              //                 Container(
              //                   margin: EdgeInsets.only(
              //                       top: 15, left: 15, right: 15, bottom: 5),
              //                   child: Text(
              //                     testimonialList[_idx]["testimonial"]
              //                         .toString(),
              //                     style: bodyText,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
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
