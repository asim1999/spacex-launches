import 'package:flutter/material.dart';
import 'package:space_x_launches/models/launchpad.dart';
import 'package:expandable/expandable.dart';
import 'package:space_x_launches/screens/launches.dart';

class LaunchpadExpansionCard extends StatelessWidget {
  final Launchpad launchpad;
  final ExpandableController controller;

  const LaunchpadExpansionCard(
      {super.key, required this.launchpad, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Launches(launchpad: launchpad),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.only(
          bottom: 4,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ExpandableNotifier(
          controller: controller,
          child: Expandable(
            collapsed: Row(
              children: [
                Expanded(
                  child: Text(
                    launchpad.name,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  launchpad.region,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            expanded: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        launchpad.name,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      launchpad.region,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Text(
                  launchpad.details ?? '',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
