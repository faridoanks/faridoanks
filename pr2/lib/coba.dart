import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

class HujanApi extends StatefulWidget {
  const HujanApi({super.key});

  @override
  State<HujanApi> createState() => _HujanApiState();
}

class Sample {
  String? name;
  String? clan;
  String? element;
  String? quote;

  Sample({this.name, this.clan, this.element, this.quote});

  @override
  String toString() {
    return 'Sample{name: $name, clan: $clan, element: $element, quote: $quote }';
  }

  factory Sample.fromJson(Map<String, dynamic> json) {
    return Sample(
        name: json['name'],
        clan: json['clan'],
        element: json['element'],
        quote: json['quote']);
  }
}

class _HujanApiState extends State<HujanApi> {
  String _jsonContent = "";
  @override
  Future _loadSample() async {
    String jsonString = await rootBundle.loadString("assets/asu.json");
    final jsonData = json.decode(jsonString);
    Sample sample = Sample.fromJson(jsonData);
    setState(() {
      _jsonContent = sample.toString();
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp();
  }
}
