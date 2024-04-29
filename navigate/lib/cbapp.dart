import 'package:flutter/material.dart';

void main() {
  runApp(const CBApp());
}

class CBApp extends StatelessWidget {
  const CBApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: const Text('Lab Activity 1'),
          bottom: const TabBar(
            labelStyle: TextStyle(color: Colors.white),
            unselectedLabelStyle: TextStyle(color: Colors.black),
            tabs: [
              Tab(text: 'Checkerboard'),
              Tab(text: 'Description'),
            ],
          ),
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
            Center(
              child: Container(color: Colors.blue, child: TheCheckerboard()),
            ),
            Center(
                child: SizedBox(
              height: 500,
              width: 1000,
              child: Text(
                  'The app features a static 8x8 checkerboard consisting of alternating black and white tiles. Each player side has 12 pieces. The pieces are purple and yellow. The pieces are placed on the first 3 rows of the board with black tiles'),
            ))
          ],
        ),
      ),
    );
  }
}

class Pieces extends StatelessWidget {
  final Color piececolor;

  const Pieces({super.key, required this.piececolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: piececolor,
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
              child: (row == 2)
                  ? Pieces(
                      piececolor: Colors.purple,
                    )
                  : (row == 6 || row == 8)
                      ? Pieces(
                          piececolor: Colors.yellow,
                        )
                      : null,
            ));
          }
        } else {
          if (column % 2 == 0) {
            tiles.add(Container(
              width: 50,
              height: 50,
              color: Colors.black,
              child: (row == 1 || row == 3)
                  ? Pieces(
                      piececolor: Colors.purple,
                    )
                  : (row == 7)
                      ? Pieces(
                          piececolor: Colors.yellow,
                        )
                      : null,
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
