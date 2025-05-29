import 'package:flutter/material.dart';

class CustomOnTap extends StatelessWidget {
  final Widget child;

  final Function() onTap;
  const CustomOnTap({
    super.key,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        onTap();
      },
      child: child,
    );
  }
}
