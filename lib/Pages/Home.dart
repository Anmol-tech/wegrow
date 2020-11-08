import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';

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

            // for (int i = 0; i < snapshot.data["Testimonial"].length; i++)
            //   testimonialList.add(snapshot.data["Testimonial"].values[i]);
            // print(imgList);
            return _body();
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  _body() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            GFCarousel(
              autoPlay: true,
              items: imgList,
              viewportFraction: 100.0,
              pagination: true,
              pauseAutoPlayOnTouch: Duration(seconds: 4),
              scrollPhysics: BouncingScrollPhysics(),
            ),
            // GFItemsCarousel(
            //   rowCount: testimonial.length,
            //   children: <Widget>[
            //     Container(
            //       child: testimonial[0].value['img'],
            //     )
            //   ],
            // ),
          ],
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
