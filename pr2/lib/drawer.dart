import 'package:flutter/material.dart';

class Konstant extends StatefulWidget {
  const Konstant({super.key});

  @override
  State<Konstant> createState() => _KonstantState();
}

class _KonstantState extends State<Konstant> {
  @override
  Widget _drawHeader() {
    return UserAccountsDrawerHeader(
      currentAccountPicture: ClipOval(
        child: Image(
          image: AssetImage(
            'assets/wp2.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      otherAccountsPictures: [
        ClipOval(
          child: Image(
            image: AssetImage(
              'assets/wp1.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ],
      accountName: Text('Ibnu Kratusi Al-Yunnan'),
      accountEmail: Text('alKratusiBinZiyyus'),
    );
  }

  Widget DrawItemm(IconData _Icon, String text, GestureTapCallback onTap) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(_Icon),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      onTap: onTap,
    );
  }

  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _drawHeader(),
          DrawItemm(Icons.folder, 'My files', () {
            print('Tap Files');
          }),
          DrawItemm(Icons.group, 'Share with Me!', () {
            print('Tap Group');
          }),
          DrawItemm(Icons.access_time, 'See recent Times', () {
            print('Tap time');
          }),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
            child: Text(
              'labels',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ),
          DrawItemm(Icons.delete, 'Tap trash', () {
            print('Tap trash');
          }),
        ],
      ),
    );
  }
}
