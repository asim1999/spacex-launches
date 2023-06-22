import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:space_x_launches/widgets/launches/launch_expansion_card.dart';

import '../../../models/launch.dart';

class SuccessTab extends StatelessWidget {
  final List<Launch> launches;
  final ExpandableController controller;

  const SuccessTab({super.key, required this.launches, required this.controller});

  List<Launch> _getSuccessfulLaunches() {
    return launches.where((launch) => launch.launchSuccess == true).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _getSuccessfulLaunches().length,
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 20,
      ),
      itemBuilder: (context, index) => LaunchExpansionCard(
          launch: _getSuccessfulLaunches()[index], controller: controller),
    );
  }
}
