import 'package:bmi_app/resultpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double height = 0;
  double weight = 0;
  double result = 0;
  int maxHeight = 300;
  int minHeight = 40;
  int maxWeight = 300;
  int minWeight = 20;
  int maxAge = 150;
  int minAge = 2;

  TextEditingController age1 = new TextEditingController();
  TextEditingController w1 = new TextEditingController();
  TextEditingController h1 = new TextEditingController();

  final List<String> _buttonSelected = ["Female", "Male", "Other"];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double uzunluk = MediaQuery.of(context).size.height;
    double genislik = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(children: [
          SizedBox(
            height: uzunluk / 10 * 1,
          ),
          Container(
            width: genislik,
            height: uzunluk / 10 * 1,
            margin: EdgeInsets.only(left: genislik / 10 * 0.5),
            child: Text(
              "Let's calculate\nyour current BMI",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: uzunluk / 10 * 0.2,
          ),
          Container(
            width: genislik,
            height: uzunluk / 10 * 1,
            margin: EdgeInsets.only(left: genislik / 10 * 0.5),
            child: Text(
              "You can find out whether you are\noverweight, underweight or ideal weight.",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.5)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              button(_buttonSelected[0]),
              button(_buttonSelected[1]),
              button(_buttonSelected[2]),
            ],
          ),
          SizedBox(
            height: uzunluk / 10 * 0.3,
          ),
          Container(
            height: uzunluk / 10 * 0.7,
            width: genislik / 10 * 9,
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty == false) {
                  if (double.parse(value) < 10) {
                    return 'Too small value';
                  } else if (double.parse(value) > 120) {
                    return 'Too big value';
                  }
                  return null;
                } else {
                  return "it is empty";
                }
              },
              controller: age1,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(3)
              ],
              decoration: InputDecoration(hintText: "Age"),
            ),
          ),
          Container(
            height: uzunluk / 10 * 0.7,
            width: genislik / 10 * 9,
            child: TextFormField(
              controller: h1,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty == false) {
                  if (double.parse(value) < 40) {
                    return 'Too small value';
                  } else if (double.parse(value) > 300) {
                    return 'Too big value';
                  }
                  return null;
                } else {
                  return "it is empty";
                }
              },
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(3)
              ],
              decoration: InputDecoration(hintText: "Height", suffixText: "cm"),
            ),
          ),
          Container(
            height: uzunluk / 10 * 0.7,
            width: genislik / 10 * 9,
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty == false) {
                  if (double.parse(value) < 40) {
                    return 'Too small value';
                  } else if (double.parse(value) > 300) {
                    return 'Too big value';
                  }
                  return null;
                } else {
                  return "it is empty";
                }
              },
              controller: w1,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(3)
              ],
              decoration: InputDecoration(hintText: "Weight", suffixText: "kg"),
            ),
          ),
          SizedBox(
            height: uzunluk / 10 * 2.8,
          ),
          GestureDetector(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                if (w1.text != '' && h1.text != '') {
                  weight = double.parse(w1.text);
                  height = double.parse(h1.text);
                  result = weight / ((height / 100) * (height / 100));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => ResultPage(
                                result: result,
                              ))));
                } else {
                  Fluttertoast.showToast(
                    msg: "Please enter values",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                  );
                }
              }
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "Calculate BMI",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
              height: uzunluk / 10 * 0.7,
              width: genislik / 10 * 8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.blue),
            ),
          ),
        ]),
      ),
    );
  }

  GestureDetector button(String _buttonSelect) {
    double uzunluk = MediaQuery.of(context).size.height;
    double genislik = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Fluttertoast.showToast(
          msg: "This is a Toast message",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );
      },
      child: Container(
        width: genislik / 10 * 2.5,
        height: uzunluk / 10 * 0.6,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black.withOpacity(0.2),
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Text(_buttonSelect),
      ),
    );
  }
}
