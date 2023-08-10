import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  final double end;
  final String stat;
  final int statValue;

  const CustomProgressIndicator({
    Key? key,
    required this.end,
    required this.stat,
    required this.statValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Row(
      children: <Widget>[
        SizedBox(
          width: 60,
          child: CustomText(
            text: stat,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
            tween: Tween<double>(
              begin: 0,
              end: end,
            ),
            builder: (context, value, _) => LinearProgressIndicator(
              value: value,
              semanticsValue: end.toString(),
              minHeight: 10,
              color: theme.colorScheme.primary,
              backgroundColor: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 50,
          child: CustomText(
            text: statValue.toString(),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
