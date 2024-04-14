import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../model/todo.dart';

class GrassCellItem2 extends StatelessWidget {
  const GrassCellItem2({
    Key? key,
    required this.todo,
    required this.onTap,
    required this.onTapDelete,
  }) : super(key: key);

  final Todo todo;
  final Function() onTap;
  final Function() onTapDelete;

  @override
  Widget build(BuildContext context) {
    return GlassmorphicFlexContainer(
      borderRadius: 20,
      blur: 10,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
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
      child: Text(
        todo.description,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      // child: ListTile(
      //   title: Text(
      //     todo.description,
      //     style: todo.done
      //         ? const TextStyle(
      //       color: Colors.white,
      //       fontSize: 30,
      //       decoration: TextDecoration.lineThrough,
      //     )
      //         : const TextStyle(
      //       color: Colors.white,
      //       fontSize: 30,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   trailing: IconButton(
      //     onPressed: onTapDelete, // TODO:削除確認用のバナーを表示させる
      //     icon: const Icon(
      //       Icons.delete,
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
    );
  }
}
