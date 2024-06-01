import 'package:flutter/material.dart';

class TaskModel {
  String id;
  String title;
  String description;
  String charity;
  String sum;
  DateTime? startDateTime;
  DateTime? stopDateTime;
  TimeOfDay? endTime;
  bool completed;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.charity,
    required this.sum,
    this.startDateTime,
    this.stopDateTime,
    this.endTime,
    this.completed = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'charity': charity,
      'sum': sum,
      'completed': completed,
      'startDateTime': startDateTime?.toIso8601String(),
      'stopDateTime': stopDateTime?.toIso8601String(),
      'endTime': endTime != null ? '${endTime!.hour}:${endTime!.minute}' : null,
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    TimeOfDay? parseTimeOfDay(String? time) {
      if (time == null) return null;
      final parts = time.split(':');
      return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
    }

    return TaskModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      charity: json['charity'],
      sum: json['sum'],
      completed: json['completed'],
      startDateTime: json['startDateTime'] != null
          ? DateTime.parse(json['startDateTime'])
          : null,
      stopDateTime: json['stopDateTime'] != null
          ? DateTime.parse(json['stopDateTime'])
          : null,
      endTime: parseTimeOfDay(json['endTime']),
    );
  }

  @override
  String toString() {
    return 'TaskModel{id: $id, title: $title, description: $description, '
        'charity: $charity, sum: $sum, startDateTime: $startDateTime, stopDateTime: $stopDateTime, '
        'endTime: $endTime, completed: $completed}';
  }
}
