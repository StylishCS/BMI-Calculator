import 'dart:developer';

import 'package:bmi_calculator/dataModel.dart';
import 'package:flutter/material.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  bool _gender = false;
  double _height = 150;
  int _weight = 60;
  int _age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(28, 33, 53, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(36, 38, 59, 1),
          title: const Text("BMI Calculator"),
          centerTitle: true,
          elevation: 0,
          titleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 190,
                    height: 200,
                    decoration: BoxDecoration(
                        color: _gender
                            ? const Color.fromRGBO(36, 38, 59, 1)
                            : const Color.fromRGBO(51, 50, 68, 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _gender = false;
                        });
                      },
                      child: const Column(
                        children: [
                          Icon(
                            Icons.male,
                            color: Colors.white,
                            size: 150,
                          ),
                          Text(
                            "Male",
                            style: TextStyle(
                                color: Color.fromRGBO(139, 140, 158, 1),
                                fontSize: 24),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 190,
                    height: 200,
                    decoration: BoxDecoration(
                        color: _gender
                            ? const Color.fromRGBO(51, 50, 68, 1)
                            : const Color.fromRGBO(36, 38, 59, 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _gender = true;
                        });
                      },
                      child: const Column(
                        children: [
                          Icon(
                            Icons.female,
                            color: Colors.white,
                            size: 150,
                          ),
                          Text(
                            "Female",
                            style: TextStyle(
                                color: Color.fromRGBO(139, 140, 158, 1),
                                fontSize: 24),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(51, 50, 68, 1),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Height",
                      style: TextStyle(
                          color: Color.fromRGBO(139, 140, 158, 1),
                          fontSize: 26),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          _height.toStringAsFixed(1),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 16.0),
                          child: Text(
                            "cm",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    SliderTheme(
                      data: const SliderThemeData(
                        trackHeight: 2,
                      ),
                      child: Slider(
                        value: _height,
                        min: 15,
                        max: 250,
                        activeColor: const Color.fromRGBO(232, 61, 103, 1),
                        onChanged: (value) {
                          setState(() {
                            _height = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 190,
                    height: 200,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(36, 38, 59, 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            "Weight",
                            style: TextStyle(
                                color: Color.fromRGBO(139, 140, 158, 1),
                                fontSize: 26),
                          ),
                          Text(
                            _weight.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    color: Colors.white,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _weight--;
                                      });
                                    },
                                    icon: const Icon(
                                        Icons.remove_circle_outlined),
                                    iconSize: 60,
                                    color:
                                        const Color.fromRGBO(139, 140, 158, 1),
                                  ),
                                ],
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    color: Colors.white,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _weight++;
                                      });
                                    },
                                    icon: const Icon(Icons.add_circle),
                                    iconSize: 60,
                                    color:
                                        const Color.fromRGBO(139, 140, 158, 1),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 190,
                    height: 200,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(51, 50, 68, 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            "Age",
                            style: TextStyle(
                                color: Color.fromRGBO(139, 140, 158, 1),
                                fontSize: 26),
                          ),
                          Text(
                            _age.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    color: Colors.white,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _age--;
                                      });
                                    },
                                    icon: const Icon(
                                        Icons.remove_circle_outlined),
                                    iconSize: 60,
                                    color:
                                        const Color.fromRGBO(139, 140, 158, 1),
                                  ),
                                ],
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    color: Colors.white,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _age++;
                                      });
                                    },
                                    icon: const Icon(Icons.add_circle),
                                    iconSize: 60,
                                    color:
                                        const Color.fromRGBO(139, 140, 158, 1),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                // log("message");
                UserModel args = UserModel(
                    gender: _gender,
                    height: _height.round(),
                    weight: _weight.round(),
                    age: _age);
                Navigator.pushNamed(context, "/result", arguments: args);
              },
              child: Container(
                alignment: Alignment.center,
                color: const Color.fromRGBO(232, 61, 103, 1),
                width: double.infinity,
                height: 103.3,
                child: const Text(
                  "Calculate",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ));
  }
}
