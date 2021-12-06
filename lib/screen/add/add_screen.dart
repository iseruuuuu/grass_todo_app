import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '';
import '../../model/todo.dart';
import '../home/home_screen_controller.dart';

class AddScreen extends StatefulWidget {
  final String? todoId;

  const AddScreen({Key? key, this.todoId}) : super(key: key);

  @override
  _AddTodoPageState createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddScreen> {
  final todoController = Get.find<HomeScreenController>();
  final textController = TextEditingController();
  Todo? todo;

  @override
  void initState() {
    super.initState();
    // 既存更新の場合（新規作成は以下無視）
    if (widget.todoId != null) {
      // 該当タスクを探してtodoに代入
      todo = todoController.getTodoById(widget.todoId!);
      if (todo != null) {
        // TextFieldにdescription表示
        textController.text = todo!.description;
      } else {
        // TODO: 該当するタスクがない場合はHomePageへ
      }
    }
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 既存編集ならID、新規作成なら「新規タスク」と表示
        title: Text('id: ${(todo?.id ?? '新規タスク')}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                TextField(
                  controller: textController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: 'タスク入力',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  style: const TextStyle(fontSize: 25),
                  maxLines: null, // 行数に制限なし
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('キャンセル'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final text = textController.text;
                    if (todo == null && text.isNotEmpty) {
                      todoController.addTodo(text); // 新規追加
                    } else if (todo != null) {
                      //todoController.updateText(text, todo!); // 既存更新
                    }
                    // TODO:ブラウザから直接アクセスした場合に対応
                    Get.back();
                  },
                  child: Text(
                    todo == null ? '追加' : '更新',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
