import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:space_x_launches/widgets/launches/launch_expansion_card.dart';

import '../../../models/launch.dart';

class FailiureTab extends StatelessWidget {
  final List<Launch> launches;
  final ExpandableController controller;

  const FailiureTab({super.key, required this.launches, required this.controller});

  List<Launch> _getFailedLaunches() {
    return launches.where((launch) => launch.launchSuccess == false).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 20,
      ),
      itemCount: _getFailedLaunches().length,
      itemBuilder: (context, index) => LaunchExpansionCard(
          launch: _getFailedLaunches()[index], controller: controller),
    );
  }
}
