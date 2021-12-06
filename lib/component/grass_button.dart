import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class GrassButton extends StatelessWidget {
  const GrassButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: onTap,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
