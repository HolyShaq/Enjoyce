import 'package:flutter/material.dart';

class BoxIconButton extends StatelessWidget {
  final Widget icon;
  const BoxIconButton({
    super.key, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        color: Colors.white,
        border: Border.all(
          color: Colors.blue,
          width: 1.0,
        ),
      ),
      width: 100,
      child: IconButton(
        icon: icon,
        onPressed: () {
          print("hello");
        },
      ),
    );
  }
}