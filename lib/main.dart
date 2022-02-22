import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Builder(builder: (context) {
        return Home();
      }),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: InvitationCard(),
      ),
    );
  }
}

class InvitationCard extends StatelessWidget {
  const InvitationCard({Key? key}) : super(key: key);

  static const int screenDivideFactor = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff48D2FD),
            Color(0xffADF6FF),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.clamp,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            width: getWidth(context) / screenDivideFactor,
            child: InvitationText(),
          ),
        ],
      ),
    );
  }

  double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}

class InvitationText extends StatefulWidget {
  InvitationText({Key? key}) : super(key: key);

  @override
  State<InvitationText> createState() => _InvitationTextState();
}

class _InvitationTextState extends State<InvitationText> {
  static const double sizedBoxHeight = 32.0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "دعوة حضور",
              style: setTextStyle(fontSize: 40),
            ),
          ),
          const SizedBox(
            height: sizedBoxHeight,
          ),
          Text(
            "عزيزي / أحمد",
            style: setTextStyle(fontSize: 30),
          ),
          Text(
            "سأسعد برؤيتك يوم 19 فبراير ، في مدينة الرياض.",
            style: setTextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: sizedBoxHeight,
          ),
          Text(
            "مع تحياتي،\nداش",
            style: setTextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  TextStyle setTextStyle({
    required double fontSize,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: "FFYaseer",
    );
  }
}
