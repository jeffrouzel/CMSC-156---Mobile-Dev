import 'package:flutter/material.dart';

void main() {
  runApp(const BarApp());
}

class BarApp extends StatelessWidget {
  const BarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BarSliderApp(),
    );
  }
}

class BarSliderApp extends StatefulWidget {
  const BarSliderApp({Key? key}) : super(key: key);

  @override
  BarSliderAppState createState() => BarSliderAppState();
}

class Bar extends StatelessWidget {
  final Color color;
  final double height;
  final ValueChanged<double> onChanged;

  const Bar({
    Key? key,
    required this.color,
    required this.height,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 100,
          height: height,
          color: color,
        ),
      ],
    );
  }
}

class BoxSliders extends StatelessWidget {
  final String sliderLabel;
  final Color sliderColor;
  final double value;
  final ValueChanged<double> onChanged;

  const BoxSliders({
    Key? key,
    required this.sliderLabel,
    required this.sliderColor,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: sliderColor,
          padding: EdgeInsets.all(3),
          child: Text(
            sliderLabel,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        Slider(
          activeColor: sliderColor,
          value: value,
          max: 300.0,
          min: 50.0,
          divisions: 5,
          label: value.round().toString(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class BarSliderAppState extends State<BarSliderApp> {
  double boxOne = 250;
  double boxTwo = 100;
  double boxThree = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Lab Activity 2',
            style: const TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(99, 43, 3, 0.971),
        ),
        body: Container(
          color: Colors.black,
          child: Column(
            children: [
              SizedBox(
                height: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Expanded(child: Container()),
                        Bar(
                          color: Color.fromRGBO(0, 255, 255, 1),
                          height: boxOne,
                          onChanged: (double value) {
                            setState(() {
                              boxOne = value;
                            });
                          },
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Expanded(child: Container()),
                        Bar(
                          color: Color.fromRGBO(255, 0, 255, 1),
                          height: boxTwo,
                          onChanged: (double value) {
                            setState(() {
                              boxTwo = value;
                            });
                          },
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Expanded(child: Container()),
                        Bar(
                          color: Color.fromRGBO(255, 255, 0, 1),
                          height: boxThree,
                          onChanged: (double value) {
                            setState(() {
                              boxThree = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              Column(
                children: [
                  BoxSliders(
                    sliderLabel: 'BoxOne',
                    sliderColor: Color.fromRGBO(0, 255, 255, 0.655),
                    value: boxOne,
                    onChanged: (value) {
                      setState(() {
                        boxOne = value;
                      });
                    },
                  ),
                  BoxSliders(
                    sliderLabel: 'BoxTwo',
                    sliderColor: Color.fromRGBO(255, 0, 255, 0.655),
                    value: boxTwo,
                    onChanged: (value) {
                      setState(() {
                        boxTwo = value;
                      });
                    },
                  ),
                  BoxSliders(
                    sliderLabel: 'BoxThree',
                    sliderColor: Color.fromRGBO(255, 255, 0, 0.655),
                    value: boxThree,
                    onChanged: (value) {
                      setState(() {
                        boxThree = value;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
