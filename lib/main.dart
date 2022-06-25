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
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _screenIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _screenIndex = index;
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
    ToDoScreen(),
    InProgressScreen(),
    DoneScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        onTap: _onItemTapped,
        currentIndex: _screenIndex,
        backgroundColor: Colors.grey[200],
        unselectedItemColor: Colors.grey[800],
        selectedItemColor: Colors.blue,
      ),
      body: _widgetOptions.elementAt(_screenIndex),
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

class ToDoScreen extends StatelessWidget {
  ToDoScreen({Key? key}) : super(key: key);

  final List<String> items =
      List<String>.generate(20, (index) => 'Todo $index');
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          child: SizedBox(
            width: double.maxFinite,
            height: 100,
            child: Center(
              child: Text(items[index]),
            ),
          ),
        );
      },
    );
  }
}

class InProgressScreen extends StatelessWidget {
  InProgressScreen({Key? key}) : super(key: key);

  final List<String> items =
      List<String>.generate(20, (index) => 'In Progress $index');
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          child: SizedBox(
            width: double.maxFinite,
            height: 100,
            child: Center(
              child: Text(items[index]),
            ),
          ),
        );
      },
    );
  }
}

class DoneScreen extends StatelessWidget {
  DoneScreen({Key? key}) : super(key: key);

  final List<String> items =
      List<String>.generate(20, (index) => 'Done $index');
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          child: SizedBox(
            width: double.maxFinite,
            height: 100,
            child: Center(
              child: Text(items[index]),
            ),
          ),
        );
      },
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
