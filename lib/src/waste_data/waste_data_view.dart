import 'package:flutter/material.dart';
import 'package:flutter_waste_app/src/settings/settings_view.dart';

class WasteDataView extends StatelessWidget {
  const WasteDataView({
    Key? key,
  }) : super(key: key);
  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Waste Data"), actions: [
        IconButton(
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
            icon: const Icon(Icons.settings))
      ]),
    );
  }
}
