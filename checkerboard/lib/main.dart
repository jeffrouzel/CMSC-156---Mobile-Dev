import 'package:flutter/material.dart';

void main() {
  runApp(const CBApp());
}

class CBApp extends StatelessWidget {
  const CBApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: const Text('Checkerboard'),
        ),
        body: Center(
          child: TheCheckerboard(),
        ),
      ),
    );
  }
}

class Pieces extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
    );
  }
}

class TheCheckerboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> tiles = [];
    for (int row = 1; row <= 8; row++) {
      for (int column = 1; column <= 8; column++) {
        if (row % 2 == 0) {
          if (column % 2 == 0) {
            tiles.add(Container(
              width: 50,
              height: 50,
              color: Colors.white,
            ));
          } else {
            tiles.add(Container(
              width: 50,
              height: 50,
              color: Colors.black,
              child: (row == 2 || row == 6 || row == 8) ? Pieces() : null,
            ));
          }
        } else {
          if (column % 2 == 0) {
            tiles.add(Container(
              width: 50,
              height: 50,
              color: Colors.black,
              child: (row == 1 || row == 3 || row == 7) ? Pieces() : null,
            ));
          } else {
            tiles.add(Container(
              width: 50,
              height: 50,
              color: Colors.white,
            ));
          }
        }
      }
    }

    return GridView.count(
      padding: const EdgeInsets.all(20),
      crossAxisCount: 8,
      children: tiles,
    );
  }
}
