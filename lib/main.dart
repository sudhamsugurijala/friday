import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Penote',
      home: AddItemScreen(),
    );
  }
}

class AddItemScreen extends StatelessWidget {
  const AddItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Penote'),
        ),
      ),
      bottomNavigationBar: const BottomMenu(),
      body: const ItemList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NewItemScreen()));
        },
        child: const Icon(Icons.add),
        tooltip: 'Add',
      ),
    );
  }
}

class NewItemScreen extends StatefulWidget {
  const NewItemScreen({Key? key}) : super(key: key);

  @override
  _NewItemScreenState createState() => _NewItemScreenState();
}

class _NewItemScreenState extends State<NewItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Note')),
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
