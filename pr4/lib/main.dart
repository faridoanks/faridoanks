import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BelajarNavBar(),
    );
  }
}

class BelajarNavBar extends StatefulWidget {
  const BelajarNavBar({super.key});

  @override
  State<BelajarNavBar> createState() => _BelajarNavBarState();
}

class _BelajarNavBarState extends State<BelajarNavBar> {
  int _currentIndex = 0;
  String _currentMenu = 'home';

  void _changeSelectedNavBar(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (index == 0) {
      _currentMenu = ' Home';
    } else if (index == 1) {
      _currentMenu = ' Order';
    } else if (index == 2) {
      _currentMenu = ' inbox';
    } else if (index == 3) {
      _currentMenu = ' account';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('belajar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Aktif',
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Index' + _currentIndex.toString(),
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Menu' + _currentMenu,
              style: TextStyle(fontStyle: FontStyle.italic),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'omah',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'orderan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'imel',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'wong',
          )
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _changeSelectedNavBar,
        type: BottomNavigationBarType.fixed,
        
      ),
    );
  }
}
