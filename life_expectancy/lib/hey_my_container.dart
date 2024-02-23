import 'package:flutter/material.dart';

class HeyMyContainer extends StatelessWidget {
  final Widget? child;
  final Color renk;
  final VoidCallback? onPress;

  HeyMyContainer(
      {this.renk = Colors.yellow,
      this.child,
      this.onPress}); // Son kısımda Default olarak değer atama yaptık bu
  // sayede required yapmaya gerek kalmadı

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: renk,
        ),
        child: child,
      ),
    );
  }
}
