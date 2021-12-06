import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:good_design_todo_app/component/add_button.dart';
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
    final controller = Get.put(HomeScreenController());
    final todos = controller.todos;
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Image.asset(
              "assets/background.gif",
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
              scale: 1,
            ),
            SafeArea(
              child: Center(
                child: GlassmorphicContainer(
                  width: deviceSize.width - 50,
                  height: deviceSize.height - 550,
                  borderRadius: 20,
                  blur: 10,
                  alignment: Alignment.bottomCenter,
                  border: 2,
                  linearGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFffffff).withOpacity(0.1),
                        const Color(0xFFFFFFFF).withOpacity(0.05),
                      ],
                      stops: const [
                        0.1,
                        1,
                      ]),
                  borderGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFFffffff).withOpacity(0.5),
                      const Color((0xFFFFFFFF)).withOpacity(0.5),
                    ],
                  ),
                  child: Padding(
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
                                fillColor: Colors.white,
                                hoverColor: Colors.white,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              style: const TextStyle(
                                color: Colors.white,
                                  fontSize: 25,
                              ),
                              maxLines: null, // 行数に制限なし
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Spacer(),
                            AddButton(
                              onTap: () {
                                final text = textController.text;
                                if (todo == null && text.isNotEmpty) {
                                  todoController.addTodo(text); // 新規追加
                                } else if (todo != null) {}
                                Get.back();
                              },
                              text: todo == null ? '追加' : '更新',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
