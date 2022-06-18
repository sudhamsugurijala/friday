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
        bottomNavigationBar: const BottomMenu(),
        body: const ItemList(),
        floatingActionButton: const FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.add),
          tooltip: 'Add',
        ),
      ),
    );
  }
}

class BottomMenu extends StatelessWidget {
  const BottomMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
      backgroundColor: Colors.grey[200],
      unselectedItemColor: Colors.grey[800],
      selectedItemColor: Colors.blue,
    );
  }
}

class ItemList extends StatelessWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (int i = 0; i < 20; ++i)
          const Card(
            child: SizedBox(
              width: double.maxFinite,
              height: 100,
              child: Center(
                child: Text('data'),
              ),
            ),
          ),
      ],
    );
  }
}
