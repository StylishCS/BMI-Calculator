import 'dart:developer';

import 'package:bmi_calculator/dataModel.dart';
import 'package:flutter/material.dart';

getStatus(double bmi) {
  if (bmi < 18.5) {
    return "Underweight";
  } else if (bmi <= 25) {
    return "Normal";
  } else if (bmi <= 35) {
    return "Overweight";
  } else {
    return "Obesity";
  }
}

getStatusMessage(double bmi) {
  if (bmi < 18.5) {
    return "You are underweight. Consider consulting with a healthcare provider for advice.";
  } else if (bmi <= 25) {
    return "You have a normal body weight. Good job!";
  } else if (bmi <= 35) {
    return "You are overweight. Consider adopting a healthier lifestyle.";
  } else {
    return "You are in the obesity range. It is important to seek guidance from a healthcare provider.";
  }
}

getStatusColor(double bmi) {
  if (bmi < 16) {
    return const Color.fromRGBO(188, 32, 32, 1);
  } else if (bmi < 17) {
    return const Color.fromRGBO(211, 136, 136, 1);
  } else if (bmi < 18.5) {
    return const Color.fromRGBO(255, 228, 0, 1);
  } else if (bmi < 25) {
    return const Color.fromRGBO(0, 129, 55, 1);
  } else if (bmi < 30) {
    return const Color.fromRGBO(255, 228, 0, 1);
  } else if (bmi < 35) {
    return const Color.fromRGBO(211, 136, 136, 1);
  } else if (bmi < 40) {
    return const Color.fromRGBO(188, 32, 32, 1);
  } else {
    return const Color.fromRGBO(138, 1, 1, 1);
  }
}

class ResultWidget extends StatelessWidget {
  const ResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel args =
        ModalRoute.of(context)!.settings.arguments as UserModel;
    final _heightInMeter = args.height / 100;
    final _heightInMeterSquare = _heightInMeter * _heightInMeter;
    final double _result = args.weight / _heightInMeterSquare;
    final String _status = getStatus(_result);
    final Color _statusColor = getStatusColor(_result);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(28, 33, 53, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(36, 38, 59, 1),
        title: const Text("BMI Calculator"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Your Result",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 630,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(51, 50, 68, 1),
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.all(80),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        _status,
                        style: TextStyle(
                            color: getStatusColor(_result),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        _result.toStringAsFixed(1),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        getStatusMessage(_result),
                        style: const TextStyle(
                            color: Color.fromRGBO(139, 140, 150, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(
                        flex: 3,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              color: const Color.fromRGBO(232, 61, 103, 1),
              width: double.infinity,
              height: 103.3,
              child: const Text(
                "Re - Calculate",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
