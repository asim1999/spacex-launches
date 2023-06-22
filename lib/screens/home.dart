import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/launchpad.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Late variable to track getting of launchpads
  late Future<List<Launchpad>> _launchpads;

  Future<List<Launchpad>> _getLaunchPads() async {
    final response = await http.get(Uri.parse('https://api.spacexdata.com/v3/launchpads'));
    List<Map<String,dynamic>> jsonData = jsonDecode(response.body);
  //  Convert to objects
    List<Launchpad> launchpads = jsonData.map((e) => Launchpad.fromJson(e)).toList();
    return launchpads;
  }

  //Call future inside initState to ensure UI is not rebuilt after initial call
  @override
  void initState() {
    super.initState();
    _launchpads = _getLaunchPads();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Launchpads'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Launchpad>>(
        future: _launchpads,
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          //Get the launchpads
          final launchpads = snapshot.data!;
          return Center(
            child: Text('${launchpads.length}'),
          );
        },
      ),
    );
  }
}
