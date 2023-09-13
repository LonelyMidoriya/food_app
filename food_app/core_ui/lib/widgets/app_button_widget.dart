import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppButtonWidget extends StatelessWidget {
  final VoidCallback? _onTap;
  final String _label;

  const AppButtonWidget({
    void Function()? onTap,
    required String label,
    super.key,
  })  : _label = label,
        _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
      ),
      child: CustomText(
        text: _label,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
