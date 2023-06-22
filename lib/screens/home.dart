import 'dart:convert';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:space_x_launches/widgets/home/launchpad_expansion_card.dart';

import '../models/launchpad.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Controller for controlling expanded and collapsed state
  late ExpandableController _expandableController;

  //Late variable to track getting of launchpads
  late Future<List<Launchpad>> _launchpads;

  Future<List<Launchpad>> _getLaunchPads() async {
    final response =
        await http.get(Uri.parse('https://api.spacexdata.com/v3/launchpads'));
    List jsonData = jsonDecode(response.body);
    //  Convert to objects
    List<Launchpad> launchpads = jsonData
        .map((e) => Launchpad.fromJson(e as Map<String, dynamic>))
        .toList();
    return launchpads;
  }

  //Call future inside initState to ensure UI is not rebuilt after initial call
  @override
  void initState() {
    super.initState();
    //Set the controller
    _expandableController = ExpandableController();
    //Start the getting of launchpads
    _launchpads = _getLaunchPads();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Launchpads'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => _expandableController.toggle(),
            icon: const Icon(
              Icons.menu,
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Launchpad>>(
        future: _launchpads,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          //Get the launchpads
          final launchpads = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            itemCount: launchpads.length,
            itemBuilder: (context, index) => LaunchpadExpansionCard(
              launchpad: launchpads[index],
              controller: _expandableController,
            ),
          );
        },
      ),
    );
  }
}
