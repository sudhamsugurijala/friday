import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Penote',
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Penote'),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_rounded),
              label: 'To Do',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.alarm_sharp),
              label: 'In Progress',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_box_rounded),
              label: 'Done',
            ),
          ],
          currentIndex: 0,
          backgroundColor: Colors.blue,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.black,
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
        floatingActionButton: const FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.add),
          tooltip: 'Add',
        ),
      ),
    );
  }
}
