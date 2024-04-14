import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:good_design_todo_app/component/grass_button.dart';
import 'package:good_design_todo_app/component/grass_cell_item2.dart';
import '../../model/todo.dart';
import 'home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    this.todo,
  }) : super(key: key);

  final Todo? todo;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController(), tag: todo?.description);
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
                  width: deviceSize.width - 30,
                  height: deviceSize.height - 150,
                  borderRadius: 20,
                  blur: 0,
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
                  child: Column(
                    children: [
                      Expanded(
                        child: Obx(
                          () => ListView.builder(
                            itemCount: todos.length,
                            itemBuilder: (context, index) {
                              final todo = todos[index];
                              return GrassCellItem2(
                                todo: todo,
                                onTap: () => controller
                                    .addTodo(todos[index].description),
                                onTapDelete: () => controller.remove(todo),
                              );
                            },
                          ),
                        ),
                      ),
                      GrassCellItem2(
                          todo: todos[0], onTap: () {}, onTapDelete: () {}),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: GrassButton(
        //onTap: () {},
        onTap: controller.onTap,
      ),
    );
  }
}
