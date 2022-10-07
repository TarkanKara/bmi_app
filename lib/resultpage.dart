import 'package:bmi_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ResultsPage extends StatefulWidget {
  double? result;
  ResultsPage({required this.result});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    double uzunluk = MediaQuery.of(context).size.height;
    double genislik = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: uzunluk / 10 * 1,
        ),
        Container(
          margin: EdgeInsets.only(left: genislik / 10 * 0.5),
          width: genislik / 10 * 9,
          height: uzunluk / 10 * 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(children: [
            SizedBox(
              height: uzunluk / 10 * 0.5,
            ),
            Container(
              height: uzunluk / 10 * 0.6,
              width: genislik,
              child: Text(
                "Your BMI is",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 40,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: uzunluk / 10 * 0.3,
            ),
            Container(
              height: uzunluk / 10 * 1.2,
              width: genislik / 10 * 7,
              child: RichText(
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                text: TextSpan(
                  text: widget.result.toString(),
                  style: TextStyle(
                      color: Colors.green.withBlue(109),
                      fontSize: 90,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: uzunluk / 10 * 0.4,
            ),
            Container(
              height: uzunluk / 10 * 1,
              width: genislik / 10 * 7,
              alignment: Alignment.center,
              child: explanation(),
            ),
            Container(
              height: uzunluk / 10 * 2,
              width: genislik / 10 * 7,
              alignment: Alignment.center,
              child: Text(
                explanation2()!,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.7), fontSize: 16),
              ),
            ),
          ]),
        ),
        SizedBox(
          height: uzunluk / 10 * 2,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
              (Route<dynamic> route) => false,
            );
          },
          child: Container(
            margin: EdgeInsets.only(left: genislik / 10 * 0.5),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.refresh_rounded,
                  color: Colors.white,
                ),
                SizedBox(
                  width: genislik / 10 * 0.2,
                ),
                Text(
                  "Start over",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            height: uzunluk / 10 * 0.7,
            width: genislik / 10 * 8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.blue),
          ),
        ),
      ]),
    );
  }

  Text explanation() {
    if (widget.result! < 18.5) {
      return Text(
        "UNDERWEIGHT",
        style: TextStyle(
            color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),
      );
    } else if (widget.result! < 25 && widget.result! >= 18.5) {
      return Text(
        "NORMAL",
        style: TextStyle(
            color: Colors.green, fontSize: 24, fontWeight: FontWeight.bold),
      );
    } else if (widget.result! < 30 && widget.result! >= 25) {
      return Text(
        "OVERWEIGHT",
        style: TextStyle(
            color: Colors.green.shade800,
            fontSize: 26,
            fontWeight: FontWeight.bold),
      );
    } else if (widget.result! < 35 && widget.result! >= 30) {
      return Text(
        "OBESE",
        style: TextStyle(
            color: Colors.red.shade600,
            fontSize: 30,
            fontWeight: FontWeight.bold),
      );
    } else if (widget.result! >= 35) {
      return Text(
        "EXTREMELY\nOBESE",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.red.shade700,
            fontSize: 34,
            fontWeight: FontWeight.bold),
      );
    } else {
      return Text(
        "WRONG VALUES",
        style: TextStyle(color: Colors.black),
      );
    }
  }

  String? explanation2() {
    if (widget.result! < 18.5) {
      return "You are underweight, you may need to put on some weight. You are recommend to ask your doctor or a dietitian for advice.";
    } else if (widget.result! < 25 && widget.result! >= 18.5) {
      return "You are at a healthy weight for your height. By maintaining a healthy weight, you lower your risk of developing serious health problems.";
    } else if (widget.result! < 30 && widget.result! >= 25) {
      return "You are slightly overweight. You may be advised to lose some weight for health reasons. You are recommended to talk to your doctor or a dietitian for advice.";
    } else if (widget.result! < 35 && widget.result! >= 30) {
      return "You are heavily overweight. Your health may be at risk if you do not lose weight. You are recommened to talk your doctor or a dietitian for advice.";
    } else if (widget.result! >= 35) {
      return "Seek advice from a weight managment practitioner quickly.";
    } else {
      return "WRONG VALUES";
    }
  }
}
