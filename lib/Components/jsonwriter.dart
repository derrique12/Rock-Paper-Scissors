import 'dart:convert';

class JsonWriter {
  late final String date;
  late final String time;
  late final String userPoints;
  late final String cpuPoints;
  late final String status;

  JsonWriter(
      {required this.date,
      required this.cpuPoints,
      required this.status,
      required this.time,
      required this.userPoints});

  JsonWriter.fromJson(Map<String, dynamic> json)
      : date = json['date'],
        cpuPoints = json['cpuPoints'],
        status = json['status'],
        time = json['time'],
        userPoints = json['userPoints'];

  Map<String, dynamic> toJson() => {
        'date': date,
        'cpuPoints': cpuPoints,
        'status': status,
        'time': time,
        'userPoints': userPoints,
      };
}
