import 'package:get/get.dart';
import 'package:good_design_todo_app/model/todo.dart';

class HomeScreenController extends GetxController {
  final _todos = <Todo>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  List<Todo> get todos => _todos; // TODO:フィルタの状態によって返すTodoを変える

  // IDからTodoを取得
  Todo? getTodoById(String id) {
    try {
      return _todos.singleWhere((e) => e.id == id);
    } on StateError {
      return null; // 該当IDがなければnullを返す
    }
  }

  // Todo新規作成
  void addTodo(String description) {
    final todo = Todo(description: description);
    _todos.add(todo);
  }

  // 指定タスクを削除
  void remove(Todo todo) {
    _todos.remove(todo); // 等価性overrideしたのでOK
  }

  // 完了タスクを一括削除
  void deleteDone() {
    _todos.removeWhere((e) => e.done == true);
  }
}
