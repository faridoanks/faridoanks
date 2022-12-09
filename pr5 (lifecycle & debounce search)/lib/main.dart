import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  List<String> data = [];
  List<String> filter = [];
  Timer? _debounce;
  String searchtext = "";

  get item => null;
  _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(Duration(milliseconds: 500), () {
      if (this.searchtext != auuu.text) {
        this.filter = this.data;
        setState(() {
          this.filter = this
              .filter
              .where(
                (item) => item
                    .toString()
                    .toLowerCase()
                    .contains(auuu.text.toString().toLowerCase()),
              )
              .toList();
        });
      }
      this.searchtext = auuu.text;
    });
  }

  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    data.add("amerika");
    data.add("azerbaijan");
    data.add("afghanistan");
    auuu.addListener(() {
      _onSearchChanged();
    });
    filter = this.data;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    auuu.removeListener(() {
      _onSearchChanged();
    });
    auuu.dispose();
    _debounce!.cancel();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState

    switch (state) {
      case AppLifecycleState.detached:
      print("detached");
      break;
      case AppLifecycleState.inactive:
      print("inactive");
      break;
      case AppLifecycleState.paused:
      print("paused");
      break;
      case AppLifecycleState.resumed:
      print("resumed");
        break;
      default:
    }
    super.didChangeAppLifecycleState(state);
  }

  final auuu = TextEditingController();
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('auu'),
          ),
          body: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    controller: auuu,
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "search here",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                        )),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: filter.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(filter[index].toString()),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },

                  ),
                ),
              ],
            ),
          )),
    );
  }
}
