import 'package:flutter/material.dart';
import 'package:flutter_waste_app/src/common_widgets/custom_button.dart';
import 'package:flutter_waste_app/src/common_widgets/custom_card.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Card(
                child: CustomCard(childCard: Text("waste data : 40kg")),
                color: Color.fromARGB(255, 11, 201, 201)),
            Card(
                child: CustomCard(
                    childCard: Text("water sensing threshold : 0.8")),
                color: Color.fromARGB(255, 192, 149, 149)),
            Card(
                child: CustomCard(
                    childCard: CustomButton(btnText: "Check Status")),
                color: Color.fromARGB(255, 209, 203, 152)),
          ],
        ),
      ),
    );
  }
}
