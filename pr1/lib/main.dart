import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mnc/logika_kalkuator.dart';
import 'hoho.dart';

void main() {
  runApp(MyApp());
}

final GlobalKey ngawi = GlobalKey();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Farid(),
    );
  }
}

class Farid extends StatefulWidget {
  const Farid({super.key});

  @override
  State<Farid> createState() => _FaridState();
}

class _FaridState extends State<Farid> {
  List<Widget> navig = [
    Acc(),
    Hom(),
    Task(),
  ];
  int _active = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text("App Sederhana"),
      ),
      body: navig[_active],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _active = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Akun",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "Tugas",
          ),
        ],
        currentIndex: _active,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class Acc extends StatelessWidget {
  const Acc({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child: Kalkulus());
  }
}

class Hom extends StatelessWidget {
  const Hom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('alok'),
      ),
    );
  }
}

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  @override
  void initState() {
    super.initState();
    this.getData();
  }

  var url = 'https://api.banghasan.com/quran/format/json/surat';

  Future<List<dynamic>> getData() async {
    var dataJson =
        await http.get(Uri.parse(url), headers: {'accept': 'application/json'});
    return json.decode(dataJson.body)['hasil'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: FutureBuilder<List<dynamic>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            var data = snapshot.data as List;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Text(
                        data[index]['nomor'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      title: Text(
                        data[index]['nama'] +
                            " " +
                            ("/") +
                            " " +
                            data[index]['asma'],
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      subtitle: Column(
                        children: <Widget>[
                          Row(
                            children: [
                              Container(
                                child:
                                    Text("Arti :" + ' ' + data[index]['arti']),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                child: Text('Tempat Diturunkan : ' +
                                    ' ' +
                                    data[index]['type']),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                child: Text('Jumlah Ayat: ' +
                                    ' ' +
                                    data[index]['ayat']),
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: Image.asset(
                        data[index]['type'] == 'mekah'
                            ? 'mekah.jpg'
                            : 'madinah.jpg',
                        width: 45,
                        height: 60,
                      ),
                    ),
                  ],
                ));
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    ));
  }
}
