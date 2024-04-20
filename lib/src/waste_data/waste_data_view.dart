import 'package:flutter/material.dart';
import 'package:flutter_waste_app/src/common_widgets/custom_button.dart';
import 'package:flutter_waste_app/src/common_widgets/custom_card.dart';
import 'package:flutter_waste_app/src/models/sensor/sensor_data.dart';
import 'package:flutter_waste_app/src/settings/settings_view.dart';
import 'package:flutter_waste_app/src/waste_data/modals/waste_data_check_modal.dart';
import 'package:flutter_waste_app/src/waste_data/waste_data_function.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Map<String, double> dataMap = {
  "Water Level": 10,
};

double maxWaterLevel = 150;

List<Color> colorList = <Color>[
  const Color.fromARGB(255, 201, 198, 64),
];

Future<void> runAfterBuild() async {
  print("running the API");
  final response =
      await http.get(Uri.parse('http://192.168.0.14:8000/api/sensor/1'));

  if (response.statusCode == 200) {
    print('data: ' + response.body);
    String jsonString = response.body;
    // Convert JSON string to Map
    Map<String, dynamic> jsonResponse = json.decode(jsonString);

    // Create a SensorData instance from the JSON data
    Sensor sensorData = Sensor.fromJson(jsonResponse);
    print(sensorData.data.details);
  }
}

class WasteDataView extends StatefulWidget {
  const WasteDataView({
    Key? key,
  }) : super(key: key);

  static const routeName = "/";
  static WasteDataFunction wasteDataFunction = WasteDataFunction();

  @override
  _WasteDataViewState createState() => _WasteDataViewState();
}

class _WasteDataViewState extends State<WasteDataView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      runAfterBuild();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      appBar: AppBar(
          title: const Text("Sensor Level Data"),
          backgroundColor: const Color.fromARGB(255, 89, 214, 126),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.restorablePushNamed(
                      context, SettingsView.routeName);
                },
                icon: const Icon(Icons.settings))
          ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 350,
              height: 400,
              child: PieChart(
                dataMap: dataMap,
                baseChartColor: const Color.fromARGB(255, 94, 88, 88),
                colorList: colorList,
                chartValuesOptions: const ChartValuesOptions(
                  showChartValuesInPercentage: true,
                ),
                totalValue: maxWaterLevel,
              ),
            ),
            const Card(
                child:
                    CustomCard(childCard: Text("current water level : 40cm")),
                color: Color.fromARGB(255, 11, 201, 201)),
            const Card(
                child: CustomCard(childCard: Text("Max Level : 150cm")),
                color: Color.fromARGB(255, 192, 149, 149)),
            Card(
              color: const Color.fromARGB(255, 77, 146, 59),
              child: OutlinedButton(
                onPressed: () => wasteDataCheckModal(context),
                child: const Text(
                  'Check Status',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
