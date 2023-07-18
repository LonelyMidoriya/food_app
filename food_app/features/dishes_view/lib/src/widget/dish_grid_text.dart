import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;

  const GridText({
    super.key,
    required this.text,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(fontWeight: fontWeight),
    );
  }
}
