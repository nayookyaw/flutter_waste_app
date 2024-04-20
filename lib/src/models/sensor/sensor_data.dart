class Sensor {
  final bool success;
  final SensorData data;
  final String message;

  Sensor({
    required this.success,
    required this.data,
    required this.message,
  });

  // Define a factory constructor to create SensorData instance from JSON
  factory Sensor.fromJson(Map<String, dynamic> json) {
    return Sensor(
      success: json['success'],
      data: SensorData.fromJson(json['data']),
      message: json['message'],
    );
  }
}

class SensorData {
  final int id;
  final String name;
  final String details;

  SensorData({
    required this.id,
    required this.name,
    required this.details,
  });

  factory SensorData.fromJson(Map<String, dynamic> json) {
    return SensorData(
      id: json['id'],
      name: json['name'],
      details: json['details'],
    );
  }
}
