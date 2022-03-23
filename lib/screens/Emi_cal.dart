// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:pie_chart/pie_chart.dart';

class EmiCal extends StatefulWidget {
  EmiCal({Key? key}) : super(key: key);

  @override
  State<EmiCal> createState() => _EmiCalState();
}

class _EmiCalState extends State<EmiCal> {
  double _currentSliderValue = 1;
  String _emiResult = "";
  String _emiResult2 = "";
  double total_Payment=0.0;
  int total_Interest = 0;
  int random = Random().nextInt(5);
  int random2 = Random().nextInt(3);
  var random3 = new Random();
  // double  slider_Prob = 0;
  //  int ran_Num =
  double num = 4;
  late double interestPayable;



//  Map<String, double> dataMap = {
//     "Principal Loan Amount": 7,
//     "Total Interest": 5,
//   };


  Map<String, double> dataMap = {
    "nothing": 0.0
  };

  TextEditingController tc = TextEditingController();
  TextEditingController tc1 = TextEditingController();
  TextEditingController tc2 = TextEditingController();
  TextEditingController tc3 = TextEditingController();

  void _calculate_Emi() {
    double A = 0.0;
    // int P = int.parse(tc.text);
   double P = double.parse(tc.text);
    double r = int.parse(tc1.text) / 12 / 100;
    // int n = (_currentSliderValue.toInt()) * 12;
    // int n = (_currentSliderValue.toInt()) * 12;
    double n = (_currentSliderValue.toInt()) * 12;
    A = (P * r * pow((1 + r), n) / (pow((1 + r), n) - 1));

    // int total_interest = (P * (r.toInt()) - n);
    total_Payment = (A * n).toDouble().roundToDouble();
    double total_interest = total_Payment - P;

    print(total_interest);
    // double totalpayment = P + total_interest;
    print(total_Payment);
     interestPayable = total_Payment - P;
    // total_Payment = totalpayment;
    // total_Interest = total_interest;
    double percentInterest = ((interestPayable) / total_Payment) * 100;

    _emiResult = A.toStringAsFixed(2);



    //  _compute() {

    // int P = int.parse(tc1.text);

    // double r = int.parse(tc2.text) / 12 / 100;

    // int n = int.parse(tc3.text) * 12;

    // double A = (P * r * pow((1 + r), n) / (pow((1 + r), n) - 1));

    // emi = A.round().toDouble();

    // totalPayment = (A * n).toDouble().roundToDouble();

    // interestPayable = totalPayment - P;

    // double percentInterest = ((interestPayable) / totalPayment) * 100;

    // dataMap = {

    //   "Total Interest": percentInterest,

    //   "Principal Loan Amount": 100 - percentInterest,

    // };

    


    
       dataMap = {
    "Principal Loan Amount": 100 -percentInterest,
    "Total Interest": percentInterest,
  };


    setState(() {
      // dataMap;
    });
  }

  // slider_Prob =  (total_Interest/total_Interest);

  Widget emiResult(emiResult) {
    bool show = false;
    String _emiResult = emiResult;
    if (_emiResult.length > 0) {
      show = true;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0)),
        Center(
          child: show
              ? Expanded(
                  child: Text(
                    " EMI :-  $_emiResult ",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.deepPurple),
                  ),
                )
              : Container(),
        ),
      ],
    );
  }

  Widget slider_value(emiresult) {
    double slide_Prob = (((total_Interest) / total_Payment) * 100);

    bool show = false;
    String _emiResult2 = emiresult;
    if (_emiResult2.length > 0) {
      show = true;
    }
    return Column(
      children: <Widget>[
        Center(
          child: show
              ? Expanded(
                  child: PieChart(
                    dataMap: dataMap,
                    chartRadius: MediaQuery.of(context).size.width / 3,
                    legendOptions: LegendOptions(
                      legendPosition: LegendPosition.bottom,
                    ),
                    chartValuesOptions: ChartValuesOptions(
                      showChartValuesInPercentage: true,
                    ),
                  ),
                )
              : Container(),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Scaffold(
        // backgroundColor: Color(0xffc8c7ce),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            'EMI Calculator',
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: Colors.purpleAccent,
          actions: [
            IconButton(
                onPressed: _calculate_Emi,
                icon: Icon(
                  Icons.calculate,
                ))
          ],
        ),
        body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: <Widget>[
              Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15.0)),
                  Expanded(
                    child: TextField(
                      controller: tc,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'Amount',
                        hintText: 'Enter the amount here',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15.0)),
                  Expanded(
                    child: TextField(
                      controller: tc1,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'ROI',
                        hintText: 'Enter rate of interest',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 15.0)),
                      Expanded(
                          child: Slider(
                        value: _currentSliderValue,
                        min: 0,
                        max: 30,
                        divisions: 6,
                        label: _currentSliderValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                        },
                      ))
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 15.0)),
                      Center(
                        child: Expanded(
                          child: Text(
                            " $_currentSliderValue Years",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              emiResult(_emiResult),
              SizedBox(height: 10),
              slider_value(_emiResult),
            ],
          ),
        ),
      ),
    );
  }
}

// Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: PieChart(
//                       dataMap: dataMap,
//                       chartRadius: MediaQuery.of(context).size.width / 3,
//                       legendOptions: LegendOptions(
//                         legendPosition: LegendPosition.bottom,
//                       ),
//                       chartValuesOptions: ChartValuesOptions(
//                         showChartValuesInPercentage: true,
//                       ),
//                     ),
//                   )
//                 ],
//               )
