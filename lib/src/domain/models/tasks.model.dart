import 'package:flutter/material.dart';

class TaskModel {
  TaskModel({required this.image, required this.title, required this.color});

  final String image;
  final String title;
  final Color color;
}

List<TaskModel> taskModel = [
  TaskModel(image: '', title: 'Физикалық қозғалыс', color: Colors.blue),
  TaskModel(image: '', title: 'Ағылшын тілі', color: Colors.red),
  TaskModel(image: '', title: 'Таңғы ашу ішу', color: Colors.orange),
  TaskModel(image: '', title: 'Жұмысты орындау', color: Colors.purple),
];
