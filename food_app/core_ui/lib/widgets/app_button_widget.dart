import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final String label;
  const AppButtonWidget({
    Key? key,
    this.onTap,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          textStyle:
              const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      child: Text(label),
    );
  }
}
