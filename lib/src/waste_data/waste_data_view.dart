import 'package:flutter/material.dart';
import 'package:flutter_waste_app/src/common_widgets/custom_button.dart';
import 'package:flutter_waste_app/src/common_widgets/custom_card.dart';
import 'package:flutter_waste_app/src/settings/settings_view.dart';
import 'package:flutter_waste_app/src/waste_data/modals/waste_data_check_modal.dart';
import 'package:flutter_waste_app/src/waste_data/waste_data_function.dart';

class WasteDataView extends StatelessWidget {
  const WasteDataView({
    Key? key,
  }) : super(key: key);
  static const routeName = "/";
  static WasteDataFunction wasteDataFunction = WasteDataFunction();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 65, 62, 62),
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
          children: <Widget>[
            const Card(
                child: CustomCard(childCard: Text("waste data : 40kg")),
                color: Color.fromARGB(255, 11, 201, 201)),
            const Card(
                child: CustomCard(
                    childCard: Text("water sensing threshold : 0.8")),
                color: Color.fromARGB(255, 192, 149, 149)),
            Card(
              child: OutlinedButton(
                onPressed: () => wasteDataCheckModal(context),
                child: const Text('Check Status'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
