import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:space_x_launches/models/launchpad.dart';

class Launches extends StatefulWidget {
  final Launchpad launchpad;

  const Launches({super.key, required this.launchpad});

  @override
  State<Launches> createState() => _LaunchesState();
}

class _LaunchesState extends State<Launches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Launches'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              myLocationEnabled: true,
              markers: {
                Marker(
                  markerId: MarkerId(widget.launchpad.siteId),
                  position: LatLng(widget.launchpad.lat, widget.launchpad.long),
                ),
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(widget.launchpad.lat, widget.launchpad.long),
                zoom: 18,
              ),
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
