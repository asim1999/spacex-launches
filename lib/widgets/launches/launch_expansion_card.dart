import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:intl/intl.dart';

import '../../models/launch.dart';

class LaunchExpansionCard extends StatelessWidget {
  final Launch launch;
  final ExpandableController controller;

  const LaunchExpansionCard(
      {super.key, required this.launch, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  launch.missionName,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                DateFormat('dd/MM/yyyy').format(launch.launchDate),
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
                      launch.missionName,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    DateFormat('dd/MM/yyyy').format(launch.launchDate),
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Text(
                launch.details ?? '',
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
