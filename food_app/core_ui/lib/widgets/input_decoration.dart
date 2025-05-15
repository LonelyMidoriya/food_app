import 'package:flutter/material.dart';

InputDecoration inputDecoration(String hint, ThemeData theme) {
  return InputDecoration(
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: theme.colorScheme.tertiary,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: theme.colorScheme.primary,
      ),
    ),
    fillColor: theme.colorScheme.tertiaryContainer,
    focusColor: Colors.grey,
    hintText: hint,
  );
}
