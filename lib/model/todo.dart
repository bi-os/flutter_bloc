import 'package:flutter/cupertino.dart';

class Todo {
  final String title;
  final String description;
  final DateTime date;
  final int id;

  Todo({@required this.title, this.description, this.date, @required this.id});

  Todo.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        description = json["description"],
        date = json["date"],
        id = json["id"];

  @override
  String toString() {
    return 'TodoModel: { title: $title, description: $description, date: $date, id: $id }';
  }
}
