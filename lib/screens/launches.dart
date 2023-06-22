import 'dart:convert';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:space_x_launches/models/launch.dart';
import 'package:space_x_launches/models/launchpad.dart';
import 'package:space_x_launches/widgets/launches/tabs/failure_tab.dart';
import 'package:space_x_launches/widgets/launches/tabs/success_tab.dart';

class Launches extends StatefulWidget {
  final Launchpad launchpad;

  const Launches({super.key, required this.launchpad});

  @override
  State<Launches> createState() => _LaunchesState();
}

class _LaunchesState extends State<Launches> {
  //Controller for controlling expanded and collapsed state
  late ExpandableController _expandableController;

  //Late variable to track getting of launches for this pad
  late Future<List<Launch>> _launches;

  Future<List<Launch>> _getLaunches() async {
    final response = await http.get(Uri.parse(
        'https://api.spacexdata.com/v3/launches/past?site_id=${widget.launchpad.siteId}'));
    List jsonData = jsonDecode(response.body);
    //  Convert to objects
    List<Launch> launches = jsonData
        .map((e) => Launch.fromJson(e as Map<String, dynamic>))
        .toList();
    return launches;
  }

  //Start
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _expandableController = ExpandableController();
    _launches = _getLaunches();
  }

  //Dispose the expandable controller when finsihed with it
  @override
  void dispose() {
    _expandableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Launches'),
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
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: GoogleMap(
                myLocationEnabled: true,
                markers: {
                  Marker(
                    markerId: MarkerId(widget.launchpad.siteId),
                    position:
                        LatLng(widget.launchpad.lat, widget.launchpad.long),
                  ),
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(widget.launchpad.lat, widget.launchpad.long),
                  zoom: 18,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: FutureBuilder<List<Launch>>(
                future: _launches,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  //Get launches
                  final launches = snapshot.data!;
                  return Column(
                    children: [
                      const TabBar(
                        tabs: [
                          Tab(text: 'Successful'),
                          Tab(text: 'Failed'),
                        ],
                      ),
                      Expanded(
                          child: TabBarView(
                        children: [
                          SuccessTab(
                              launches: launches,
                              controller: _expandableController),
                          FailiureTab(
                              launches: launches,
                              controller: _expandableController),
                        ],
                      ))
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
