import 'package:flutter/material.dart';
import 'package:flutter_waste_app/src/waste_data/widgets/progress_bar.dart';

Future<void> wasteDataCheckModal(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Device Health Check'),
        contentPadding: const EdgeInsets.all(16.0),
        content: const Text('Please wait a moment to see live health check\n'
            'of device, sometimes it may take a few minites\n'
            'to see the status because of connection.'),
        actions: <Widget>[
          // const StatusProgressIndicator(),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Activate'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
