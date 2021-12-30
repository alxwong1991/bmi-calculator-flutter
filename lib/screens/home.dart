import '/constants/app_constants.dart';
import '/widgets/left_bar.dart';
import '/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double bmiResult = 0;
  String textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator",
              style: TextStyle(
                  color: accentHexColor, fontWeight: FontWeight.w300)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: mainHexColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 130,
                    child: TextField(
                      controller: heightController,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Height",
                          hintStyle: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w300,
                              color: Colors.white.withOpacity(0.8))),
                    ),
                  ),
                  Container(
                      width: 130,
                      child: TextField(
                        controller: weightController,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: accentHexColor),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Weigth",
                            hintStyle: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w300,
                                color: Colors.white.withOpacity(0.8))),
                      )),
                ],
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  double _h = double.parse(heightController.text);
                  double _w = double.parse(weightController.text);
                  setState(() {
                    bmiResult = _w / (_h * _h);
                    if (bmiResult > 30) {
                      textResult = "You\'re obese";
                    } else if (bmiResult >= 25 && bmiResult <= 30) {
                      textResult = "You\'re over weight";
                    } else if (bmiResult >= 18.5 && bmiResult <= 25) {
                      textResult = "You have normal weight";
                    } else {
                      textResult = "You\'re under weight";
                    }
                  });
                },
                child: Container(
                    child: Text("Calculate",
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: accentHexColor))),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                  child: Text(
                bmiResult.toStringAsFixed(2),
                style: TextStyle(fontSize: 70, color: accentHexColor),
              )),
              SizedBox(height: 30),
              Visibility(
                  visible: textResult.isNotEmpty,
                  child: Container(
                    child: Text(textResult,
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w400,
                            color: accentHexColor)),
                  )),
              SizedBox(height: 10),
              LeftBar(barWidth: 40),
              SizedBox(height: 20),
              LeftBar(barWidth: 70),
              SizedBox(height: 20),
              LeftBar(barWidth: 40),
              SizedBox(height: 20),
              RightBar(barWidth: 70),
              SizedBox(height: 50),
              RightBar(barWidth: 70),
            ],
          ),
        ));
  }
}
