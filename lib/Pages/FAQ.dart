import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQ extends StatefulWidget {
  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: new EdgeInsets.all(10.0),
        child: Column(
          children: [
            accordian(
                '  What is Wegrow ?',
                '''Homeflic wegrow is a tribe of people from all over the world, having diverse mindsets and personalities, learning and growing together. It’s a platform where people can showcase their talent,discuss their problems, talk about trending topics and build a network stronger than any bond.''',
                0xFFFF0065),
            accordian(
                '  Who can join Wegrow ?',
                ''' 1. YOU

 2. And that annoying friend who keeps calling for no reason.

 3. And the one who never picks up.

 4. The one whom you cheat from and the one you share your burger with,

 5. The ones you've lost touch with and

 6. The ones that you meet daily!''',
                0xFF00ADEF),
            accordian(
              '  How can I join Wegrow ?',
              '''1. Provides people with an environment where they can discuss their issues and can open up without any fear of judgement.
                
 2. Discuss various social issues and contribute towards society in many ways through our various drives under various community outreach programmes.
 
 3. Provides courses and knowledge meets  to school/college students for enhancement of their skills.
 
 4. Organizes various parties/events/trips/excursions for recreational purposes.
 ''',
              0xFF00A652,
            ),
            accordian(
                '  What do we do at Wegrow ?',
                '''We are a family where we support each other and guide through real life problems while learning from each other. We are a platform for your skill development and building a better future.''',
                0xFFC12C6E),
            accordian(
                '  What is S.C.O.P.E ?',
                '''S.C.O.P.E expands into Student Community Outreach Programme for Es wherein E stands for our Essue of the month [ Essentials, Empowerment, Environment, Education etc. ] and changes periodically, owing to changing  social scenarios.''',
                0xFFE18619)
          ],
        ),
      ),
    );
  }

  accordian(heading, text, color) {
    var factor = MediaQuery.of(context).size.aspectRatio;
    var orentation = MediaQuery.of(context).orientation;
    var titleText = GoogleFonts.montserrat(
      textStyle: TextStyle(
        color: Colors.white,
        fontSize:
            orentation == Orientation.landscape ? 14 * factor : factor * 35,
        fontWeight: FontWeight.w500,
      ),
    );
    var bodyText = GoogleFonts.montserrat(
      textStyle: TextStyle(
        fontSize:
            orentation == Orientation.landscape ? 10 * factor : factor * 30,
        fontWeight: FontWeight.w400,
      ),
    );
    return GFAccordion(
        collapsedTitleBackgroundColor: Color(color),
        expandedTitleBackgroundColor: Color(color),
        title: heading,
        titleBorderRadius: BorderRadius.circular(15),
        contentBorderRadius: BorderRadius.circular(15),
        contentPadding: EdgeInsets.all(20),
        contentChild: Text(
          text,
          style: bodyText,
          softWrap: true,
          textAlign: TextAlign.justify,
        ),
        textStyle: titleText,
        contentBackgroundColor: Colors.white,
        collapsedIcon: Icon(
          Icons.arrow_circle_down_rounded,
          color: Colors.white,
          size: 30,
        ),
        expandedIcon: Icon(
          Icons.arrow_circle_up_rounded,
          size: 30,
          color: Colors.white,
        ));
  }
}
