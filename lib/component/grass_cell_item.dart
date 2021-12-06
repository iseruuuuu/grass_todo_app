import 'package:flutter/material.dart';
import '../model/todo.dart';

class GrassCellItem extends StatelessWidget {
  const GrassCellItem({
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
    return ListTile(
      //onTap: onTap, // TODO:RouterにIDを渡してタスク編集画面に遷移
      title: Text(
        todo.description,
        style: todo.done
            ? const TextStyle(
                color: Colors.grey,
                fontSize: 30,
                decoration: TextDecoration.lineThrough,
              )
            : const TextStyle(fontSize: 30),
      ),
      trailing: IconButton(
        onPressed: onTapDelete, // TODO:削除確認用のバナーを表示させる
        icon: const Icon(Icons.delete),
      ),
    );
  }
}
