import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class Item2 extends StatelessWidget {
  const Item2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassmorphicFlexContainer(
      borderRadius: 20,
      blur: 20,
      padding: EdgeInsets.symmetric(
        horizontal: 90,
        vertical: 280,
      ),
      alignment: Alignment.bottomCenter,
      border: 2,
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFffffff).withOpacity(0.1),
            Color(0xFFFFFFFF).withOpacity(0.05),
          ],
          stops: [
            0.1,
            1,
          ]),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFffffff).withOpacity(0.5),
          Color((0xFFFFFFFF)).withOpacity(0.5),
        ],
      ),
      child: SizedBox(
        width: 10,
        height: 10,
      ),
    );
  }
}
