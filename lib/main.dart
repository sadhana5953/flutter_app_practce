import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => clock(),
      },
    ),
  );
}

class clock extends StatefulWidget {
  const clock({super.key});

  @override
  State<clock> createState() => _clockState();
}

class _clockState extends State<clock> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          dateTime = DateTime.now();

          switch (dateTime.weekday) {
            case 1:
              day = 'Mon';
              break;
            case 2:
              day = 'Tue';
              break;
            case 3:
              day = 'Wed';
              break;
            case 4:
              day = 'Thu';
              break;
            case 5:
              day = 'Fri';
              break;
            case 6:
              day = 'Sat';
              break;
            case 7:
              day = 'Sun';
              break;
          }

          switch (dateTime.month) {
            case 1:
              month = 'January';
              break;
            case 2:
              month = 'February';
              break;
            case 3:
              month = 'March';
              break;
            case 4:
              month = 'April';
              break;
            case 5:
              month = 'May';
              break;
            case 6:
              month = 'June';
              break;
            case 7:
              month = 'July';
              break;
            case 8:
              month = 'Agust';
              break;
            case 9:
              month = 'September';
              break;
            case 10:
              month = 'October';
              break;
            case 11:
              month = 'November';
              break;
            case 12:
              month = 'December';
              break;
          }
        });
      });
    });
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.only(top: 150),
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
            fit: BoxFit.cover, image: AssetImage("assets/image/clockApp.webp")),
      ),
      child: Column(
        children: [
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: '${dateTime.hour % 12}:${dateTime.minute}',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w500)),
            TextSpan(
                text: '${(dateTime.hour > 12 ? (' pm\n') : (' am\n'))}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            TextSpan(
                text: '     ${day}, ${month} ${dateTime.day}',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500)),
          ]))
        ],
      ),
    ));
  }
}

DateTime dateTime = DateTime.now();
String day = '';
String month = '';
