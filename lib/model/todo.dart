import 'package:flutter/cupertino.dart';

@immutable
class Todo {
  final String id;
  final String description;
  final bool done;

  // 説明【1】
  Todo({required this.description, this.done = false})
      : id = DateTime.now().millisecondsSinceEpoch.toString();

  // 説明【2】
  const Todo.withId(
      {required this.id, required this.description, this.done = false});

  // サンプルタスク
  static const initialTodos = [
    Todo.withId(
      id: '0',
      description: '犬の散歩',
      done: true,
    ),
    Todo.withId(
      id: '1',
      description: '学校の宿題\n- 国語\n- 算数\n- 英語',
    ),
    Todo.withId(
      id: '2',
      description: '夏休みの計画',
    ),
  ];
}
