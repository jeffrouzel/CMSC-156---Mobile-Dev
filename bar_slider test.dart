import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Lab Activity 2';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double redBoxHeight = 100;
  double greenBoxHeight = 100;
  double blueBoxHeight = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lab Activity 2',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ChangeableBoxWithSlider(
                      color: Colors.red,
                      height: redBoxHeight,
                      onChanged: (value) {
                        setState(() {
                          redBoxHeight = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ChangeableBoxWithSlider(
                      color: Colors.green,
                      height: greenBoxHeight,
                      onChanged: (value) {
                        setState(() {
                          greenBoxHeight = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ChangeableBoxWithSlider(
                      color: Colors.blue,
                      height: blueBoxHeight,
                      onChanged: (value) {
                        setState(() {
                          blueBoxHeight = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SliderWithLabel(
                    label: 'Red',
                    activeColor: Colors.red,
                    value: redBoxHeight,
                    onChanged: (value) {
                      setState(() {
                        redBoxHeight = value;
                      });
                    },
                  ),
                  SliderWithLabel(
                    label: 'Green',
                    activeColor: Colors.green,
                    value: greenBoxHeight,
                    onChanged: (value) {
                      setState(() {
                        greenBoxHeight = value;
                      });
                    },
                  ),
                  SliderWithLabel(
                    label: 'Blue',
                    activeColor: Colors.blue,
                    value: blueBoxHeight,
                    onChanged: (value) {
                      setState(() {
                        blueBoxHeight = value;
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChangeableBoxWithSlider extends StatelessWidget {
  final Color color;
  final double height;
  final ValueChanged<double> onChanged;

  const ChangeableBoxWithSlider({
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

class SliderWithLabel extends StatelessWidget {
  final String label;
  final Color activeColor;
  final double value;
  final ValueChanged<double> onChanged;

  const SliderWithLabel({
    Key? key,
    required this.label,
    required this.activeColor,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
        Slider(
          activeColor: activeColor,
          value: value,
          max: 300.0,
          min: 50.0,
          onChanged: onChanged,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
