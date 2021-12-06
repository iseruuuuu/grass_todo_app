import 'package:flutter/cupertino.dart';

@immutable
class Todo {
  final String id;
  final String description;
  final bool done;

  Todo({required this.description, this.done = false})
      : id = DateTime.now().millisecondsSinceEpoch.toString();

  const Todo.withId(
      {required this.id, required this.description, this.done = false});
}
