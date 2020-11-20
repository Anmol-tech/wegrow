import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WhatYouGet extends StatefulWidget {
  @override
  _WhatYouGetState createState() => _WhatYouGetState();
}

class _WhatYouGetState extends State<WhatYouGet> {
  @override
  Widget build(BuildContext context) {
    var list = [
      0XFFc2436f,
      0xFFe08727,
      0xFFf24d65,
      0xFF11aeef,
      0xFF4ea751,
    ];

    return ListView(children: [
      itemSet(
          'Knowledge Meets',
          '''At wegrow we want to give voice to the youngsters and address the issues that get covered under the layers of lack of education and proper conversation. They are left unaddressed and over time, become a taboo. Via these summits and meets we will try to change the society around and will try to bring the much-needed change around us. With great influencing youth icons coming to address these issues a lot of young minds will bloom and fly high''',
          'Images/Images/icon1.png',
          list[1],
          context),
      itemSet(
          'Quizzes & Competition',
          '''Healthy competition not only increases the efficiency but also leads to team building and joint efforts put by all. At WeGrow, we conduct these quizzes to check everyone's knowledge on different topics and most of all make them aware about those he didn't know earlier about. Conducting regular competitions not only provides everyone a nation wide platform but also boosts their confidence hence making them future ready. These competitions are conducted on various topics for every age group keeping in mind  their interests and knowledge levels.''',
          'Images/Images/icon2.png',
          list[2],
          context),
      itemSet(
          'Game Nights',
          '''All work and no play makes Jack a dull boy!
And how come that can happen when you are a part of the WeGrow family. We are here with exciting game nights for everyone where we will play and compete across the globe, where the players will be joining us from various cities and countries!! These games will not only be for fun but will also be very knowledgeable hence two in one benefits.''',
          'Images/Images/icon3.png',
          list[3],
          context),
      itemSet(
          'Literary Events',
          '''When you get a platform to showcase your art you strive to enhance your skills even more. In these literary events we will host: Podcasts, open mics, poetry recitation, short story sessions and many more such things where people can showcase their work and get to hear others in a calm and knowledgeable environment where everyone is there to share their feelings and know what others feel. These activities will enhance public speaking and will provide perspective to all by increasing the horizon. ''',
          'Images/Images/icon4.png',
          list[4],
          context),
      itemSet(
          'GD and Debating',
          '''Where young minds can talk freely and debate, there arises solutions to the most difficult problems in the most practical ways. Our motive behind these discussions are the same. We are trying to provide a platform to the youth to come up and discuss what they feel, be fearless and defend their preferences, fight, talk, debate and come up with the ideas that can transform us all and can change the general mindset.  These discussions will be on the major untouched societal issues that are important but never discussed in open.''',
          'Images/Images/icon5.png',
          list[0],
          context),
      itemSet(
          'Entrepreneurship Boot Camp',
          '''Ever dreamt of starting your own business but the stress of funding, failure and criticism pulls you back? Ever thought of taking over the entrepreneur world with your ideas, but don’t know where to begin with?

We the tribe of WeGrow are providing you with all the answers to all your questions by the finest leading experts in the entrepreneur world.

WHAT EXACTLY IS ENTREPRENEURSHIP BOOTCAMP?

A bootcamp generally means training camp for learning various types of skills. In Entrepreneurship bootcamp we will bring together young entrepreneurs/leaders from across India and help them discover the areas which will help them grow as an individual as well as their business. 

WHY WEGROW?

Here at WeGrow, unlike basic and dull bootcamps, we’ll make it a lot more happening and won’t let you regret. Every second spent at the bootcamp will be worth your time and after it ends you’ll definitely come out as a new and confident individual.

The best part is yet to come..
So? R E A D Y?
1
2
3
..
WE WILL BE PROVIDING YOU WITH FUNDS WORTH ₹3,00,000 FOR YOUR STARTUP!!

So what are you waiting for? Enrol now and grab this opportunity be a #tribester and grow with WeGrow.''',
          'Images/Images/icon6.png',
          list[1],
          context),
      itemSet(
          'Knowledge Summits',
          '''Whether an extrovert or an introvert this knowledge summit is open for all, because we at WeGrow believe in equality

The sessions included are :

1. Hard skills : We’ll provide you with best hard skills knowledge by the experts from various fields.

2. Soft skills development : Do you lack confidence? Do you have stage fear? Don’t worry we are here to help you with legit anything and everything.

3. Literary nights : For every budding poet and writer out there, this is your call to showcase your admirable pieces.

4. Gaming nights : For every gaming enthusiast out there, here’s your chance to let everyone know who the real MVP is !!!

5. Motivational nights : Feeling low? Feeling anxious? Need the right kind of motivation, well this is your one stop for all the feelings that cannot be described but still weighs you down. Join this tribe, feel the vibes and grow as an individual together with WeGrow.

Also, there will be a fun and interactive session where we'll give each and everyone to talk about things that are normal but not considered normal by our society, in short the taboos. Periods, pride and everything. 
So keep your pens and papers ready, write your heart out because we are inviting you the greatest knowledge summit everrrrr!''',
          'Images/Images/icon7.png',
          list[2],
          context),
      itemSet(
          'Volunteering Opportunities',
          '''Homeflic Wegrow SCOPE is an initiative wherein our tribesters promote social change, development, cohesion and the empowerment of people and communities, and other creatures through various drives.
PERKS.

GOOD DEEDS SHOULD BE DONE WITH INTENTION AND NOT FOR ATTENTION.

With the negative impacts of society comes some positive impacts too. 
When you volunteer with scope you get to pay back to the society. In this drive we will be arranging various events, like feeding underprivileged people, feeding stray animals and much more. 
Usually, we’ve seen people posting pictures of themselves feeding the underprivileged people which is quite unacceptable but here we do not believe in advertising our deeds instead we believe in bringing smiles to those faces by doing our best!
So, what are you waiting for? Join our tribe and let’s bring smile on those bright faces together!''',
          'Images/Images/icon8.png',
          list[3],
          context),
      itemSet(
          'Internship Opportunity',
          '''We all dream of a job where we want to feel comfortable, we want to have less work pressure, where we don’t want colleagues but a family 
Well, WeGrow is here at your service, fellas! We provide you with internship opportunities in various fields like HR, content department and much more
We are a TRIBE, a tribe full of vibe! 
We provide stipends for the best leaders! 
Here you aren’t an intern but a leader.
So what are you waiting for? Show us what you’ve got and join our tribe be our exclusive #tribester''',
          'Images/Images/icon9.png',
          list[4],
          context),
      itemSet(
          'Official Merchandise',
          '''Once you join our tribe, we’ll not let you be empty-handed instead you’ll have access to our official merchandise which symbolizes our bond. We have designed a t-shirt with our tribe’s logo in the front and #systemhiladenge at the back.
So are you ready to shake the system? 
Come and join us! We’re waiting to have you in our tribe!''',
          'Images/Images/icon10.png',
          list[0],
          context),
      itemSet(
          'Musical Evenings, Meet & More',
          '''what happens if a community offers you an evening for soul stirring music?

We grow gives you the opportunity to witness the greatest talent across the world to put together a soulful evening and more.''',
          'Images/Images/icon11.png',
          list[1],
          context),
      itemSet(
          'Open Mics',
          '''Open mic events are a rite of passage for many people. Here, as the world opens to the new normal, it is time for all the budding speakers to try out new material at our open mic events.''',
          'Images/Images/icon12.png',
          list[2],
          context),
      itemSet(
          'Events and Parties',
          '''Apart from growing together, let's bond for a celebration and enjoy forgetting all limits. Enjoy the luxury, excitement and delicacies come together to curate the best experience at homeflic wegrow.''',
          'Images/Images/icon13.png',
          list[3],
          context),
      itemSet(
          'Certificate Courses',
          '''homeflic wegrow is delighted to offer you a variety of certified courses to stand out in your field and  showcase your valuable knowledge and key skills.''',
          'Images/Images/icon14.png',
          list[4],
          context),
      itemSet(
          'Trips/ Excursions/ Day out',
          '''Haven't been anywhere, but everything in your list? There are some great opportunities from wegrow to satisfy anyone wishing to wander. Excursions and trips will help you to engage with industry professionals to build networks.''',
          'Images/Images/icon15.png',
          list[0],
          context),
      itemSet(
          'One-on-one Sessions',
          '''Research shows we learn best from people we get on well with, in a friendly and relaxed atmosphere. We provide personalized one-on-one sessions for high quality interaction''',
          'Images/Images/icon16.png',
          list[1],
          context),
      itemSet(
          'A family like tribe to learn, achieve and grow with',
          '''Here we go, here we grow a family with a holistic approach to develop one's personality and gain success in the pillar of life''',
          '',
          list[2],
          context),
    ]);
  }
}

itemSet(title, text, image, color, context) {
  var orentation = MediaQuery.of(context).orientation;
  var factor = MediaQuery.of(context).size.aspectRatio;
  var headingText = GoogleFonts.montserrat(
    textStyle: TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontSize: orentation == Orientation.landscape ? factor * 15 : factor * 30,
    ),
  );
  var bodyText = GoogleFonts.montserrat(
    textStyle: TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.white,
      fontSize: orentation == Orientation.landscape ? factor * 13 : factor * 27,
    ),
  );

  return InkWell(
    splashColor: Color(color),
    child: Container(
      padding: EdgeInsets.all(10.0),
      child: ExpansionTileCard(
        animateTrailing: true,
        trailing: Icon(
          Icons.arrow_circle_down_rounded,
          size: factor * 45,
          color: Colors.white,
        ),
        contentPadding: EdgeInsets.all(20),
        baseColor: Color(color),
        expandedColor: Color(color),
        onExpansionChanged: (val) {},
        title: Text(title, style: headingText),
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            // shape: BoxShape.circle,
            color: Color(color),
            image: DecorationImage(
              // scale: 10.0,
              image: AssetImage(image),
              fit: BoxFit.contain,
            ),
          ),
        ),
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16,
                  bottom: 12.0,
                ),
                child: Text(
                  text,
                  style: bodyText,
                  textAlign: TextAlign.justify,
                ),
              )),
        ],
      ),
    ),
  );
}
