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
  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
