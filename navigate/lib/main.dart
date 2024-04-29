import 'package:flutter/material.dart';
import 'package:navigate/barapp.dart';
import 'package:navigate/cbapp.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => NavigationHomeScreen(),
        '/bar': (context) => BarApp(), // Define route for BarApp
        '/board': (context) => CBApp(), // Define route for CBApp
      },
    );
  }
}

class NavigationHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Navigation Home Screen',
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black),
      body: Center(
        child: SizedBox(
          height: 150,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Navigate to the checkerboard using named route
                  Navigator.pushNamed(context, '/board'); // Navigate to CBApp
                },
                child: const Text('Go to Checkerboard Screen'),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the barslider using named route
                  Navigator.pushNamed(context, '/bar'); // Navigate to BarApp
                },
                child: const Text('Go to Bar Slider Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
