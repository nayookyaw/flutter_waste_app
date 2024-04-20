import 'package:flutter/cupertino.dart';
import 'package:flutter_waste_app/src/waste_data/modals/waste_data_check_modal.dart';

import 'package:http/http.dart' as http;
import 'dart:developer';

class WasteDataFunction {
  Future<void> actionPress(BuildContext context) {
    return wasteDataCheckModal(context);
  }

  Future<double> getWaterLevel() async {
    double waterLevel = 0.0;

    final response =
        await http.get(Uri.parse('http://192.168.0.14:8000/api/sensor/1'));

    if (response.statusCode == 200) {
      log('data: ' + response.body);
    }
    return waterLevel;
  }
}
